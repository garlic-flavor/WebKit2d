/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module mBrowser.BrowserWindow;

import std.algorithm, std.exception, std.range;
import win32.windows, win32.commctrl;
import mBrowser.BrowserView;
import mBrowser.MiniBrowser;
import mBrowser.resource;

class BrowserWindow
{
public:

	void createWindow( int x, int y, int width, int height )
	{
		enforce( null is _window );
		WNDCLASSEX window_class;
		with( window_class )
		{
			cbSize = WNDCLASSEX.sizeof;
			lpfnWndProc = &BrowserWindowWndProc;
			cbWndExtra = this.sizeof;
			hInstance = MiniBrowser.singleton.instance;
			hCursor = LoadCursor( null, IDC_ARROW );
			hbrBackground = cast(HBRUSH)GetStockObject( WHITE_BRUSH );
			lpszMenuName = MAKEINTRESOURCE( IDR_MAINFRAME );
			lpszClassName = "MiniBrowser"w.ptr;
		}
		RegisterClassEx( &window_class );
		CreateWindow( "MiniBrowser"w.ptr, "MiniBrowser"w.ptr, WS_OVERLAPPEDWINDOW, x, y, width, height, null, null
		            , MiniBrowser.singleton.instance, cast(void*)this );
	}

	void showWindow()
	{
		assert( null !is _window );
		ShowWindow( cast(HWND)_window, SW_SHOWNORMAL );
	}

	void goToURL( wstring url )
	{
		_browser_view.goToURL( url );
	}

	bool handleMessage( in ref MSG message )
	{
		if( message.hwnd !is _combobox_window && !IsChild( _combobox_window, cast(void*)message.hwnd ) )
			return false;
		if( message.message != WM_KEYDOWN ) return false;

		if( message.wParam != VK_RETURN ) return false;

		wchar[] buf;
		auto textLength = GetWindowTextLength( _combobox_window );
		buf = new wchar[ textLength + 1 ];
		GetWindowText( _combobox_window, buf.ptr, buf.length );

		wstring url = buf[ 0 .. textLength ].idup;
		if( url.find( ":" ).empty ) url = "http://" ~ url;

		_browser_view.goToURL( url );

		return true;
	}

	BrowserView view() { return _browser_view; }
	HWND window() { return _window; }

	static extern(Windows) int BrowserWindowWndProc( HWND window, uint message, uint wp, int lp )
	{
		try
		{
			if( WM_CREATE == message )
			{
				auto create_struct = cast(LPCREATESTRUCT)lp;
				auto browser_window = cast(BrowserWindow)(create_struct.lpCreateParams);
				browser_window._window = window;
				SetWindowLongPtr( window, 0, cast(int)cast(void*)browser_window );
				browser_window.onCreate( create_struct );
				return 0;
			}
			else
			{
				auto browser_window = cast(BrowserWindow)cast(void*)GetWindowLongPtr( window, 0 );
				if( null !is browser_window ) return browser_window.wndProc( window, message, wp, lp );
			}
		}
		catch( Throwable t ) { MessageBoxA( null, (t.toString ~ "\0").ptr, "alert", MB_OK ); }

		return DefWindowProc( window, message, wp, lp );
	}

private:
	HWND _window;
	HWND _rebar_window;
	HWND _combobox_window;
	BrowserView _browser_view;

	int wndProc( HWND window, uint message, uint wp, int lp )
	{
		int result = 0;
		bool handled = true;
		switch( message )
		{
			case        WM_ERASEBKGND:
				result = 1;
			break; case WM_COMMAND:
				result = onCommand( LOWORD(wp), handled );
			break; case WM_SIZE:
				onSize( LOWORD(lp), HIWORD(lp) );
			break; case WM_DESTROY:
				onDestroy();
			break; case WM_NCDESTROY:
				onNCDestroy();
			break; default:
				handled = false;
		}

		if( !handled ) result = DefWindowProc( window, message, wp, lp );
		return result;
	}

	void onCreate( LPCREATESTRUCT createStruct )
	{
		MiniBrowser.singleton.registerHandler( &handleMessage );

		_rebar_window = enforce( CreateWindowEx( 0, "ReBarWindow32"w.ptr, ""w.ptr
		                                       , WS_VISIBLE | WS_BORDER | WS_CHILD | WS_CLIPCHILDREN
		                                         | WS_CLIPSIBLINGS | CCS_NODIVIDER | CCS_NOPARENTALIGN
		                                         | RBS_VARHEIGHT | RBS_BANDBORDERS, 0, 0, 0, 0, _window, null
		                                       , createStruct.hInstance, null )
		                        , "CreateWindow for rebar_window failed." );
		REBARINFO rebarInfo;
		rebarInfo.cbSize = REBARINFO.sizeof;
		rebarInfo.fMask = 0;
		SendMessage( _rebar_window, RB_SETBARINFO, 0, cast(int)cast(void*)&rebarInfo );

		_combobox_window = enforce( CreateWindowEx( 0, "combobox"w.ptr, ""w.ptr
		                                          , WS_VISIBLE | WS_CHILD | WS_TABSTOP | WS_VSCROLL
		                                            | WS_CLIPCHILDREN | WS_CLIPSIBLINGS | CBS_AUTOHSCROLL
		                                            | CBS_DROPDOWN, 0, 0, 0, 0, _rebar_window, null
		                                          , createStruct.hInstance, null )
		                          , "CreateWindow for combobox_window failed." );
		SendMessage( _combobox_window, WM_SETFONT, cast(uint)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM( 1, 0 ) );

		RECT comboboxRect; GetWindowRect( _combobox_window, &comboboxRect );
		REBARBANDINFO bandInfo;
		with( bandInfo )
		{
			cbSize = REBARBANDINFO.sizeof;
			fMask = RBBIM_STYLE | RBBIM_TEXT | RBBIM_CHILD | RBBIM_CHILDSIZE | RBBIM_SIZE;
			fStyle = RBBS_CHILDEDGE | RBBS_GRIPPERALWAYS;
			lpText = cast(wchar*)"Address"w.ptr;
			hwndChild = _combobox_window;
			cx = 100;
			cxMinChild = comboboxRect.right - comboboxRect.left;
			cyMinChild = comboboxRect.bottom - comboboxRect.top;
		}

		auto result = SendMessage( _rebar_window, RB_INSERTBAND, cast(uint)-1, cast(int)&bandInfo );

		auto webViewRect = RECT( 0, 0, 0, 0 );
		_browser_view = new BrowserView( webViewRect, this );
	}

	void onDestroy()
	{
		MiniBrowser.singleton.unregisterWindow( &handleMessage );
	}

	void onNCDestroy()
	{
	}

	void onSize( int width, int height )
	{
		RECT rebarRect; GetClientRect( _rebar_window, &rebarRect );
		MoveWindow( _rebar_window, 0, 0, width, rebarRect.bottom - rebarRect.top, true );

		RECT webViewRect;
		webViewRect.top = rebarRect.bottom;
		webViewRect.left = 0;
		webViewRect.right = width;
		webViewRect.bottom = height;
		_browser_view.setFrame( webViewRect );
	}

	int onCommand( int commandID, ref bool handled )
	{
		switch( commandID )
		{
			case        ID_FILE_NEW_WINDOW:
				MiniBrowser.singleton.createNewWindow();
			break; case ID_FILE_CLOSE:
				PostMessage( _window, WM_CLOSE, 0, 0 );
			break; case ID_DEBUG_SHOW_WEB_VIEW:// what is this for?
			{
				auto menu = GetMenu( _window );
				auto shouldHide = GetMenuState( menu, ID_DEBUG_SHOW_WEB_VIEW, MF_BYCOMMAND ) & MF_CHECKED;

				CheckMenuItem( menu, ID_DEBUG_SHOW_WEB_VIEW, MF_BYCOMMAND | (shouldHide ? MF_UNCHECKED : MF_CHECKED ) );

				auto webViewWindow = WKViewGetWindow( _browser_view.webView );
				ShowWindow( webViewWindow, shouldHide ? SW_HIDE : SW_SHOW );
			}
			break; default:
				handled = false;
		}
		return 0;
	}


}
