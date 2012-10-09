/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module mBrowser.BrowserView;

import std.exception;
import win32.windows;
public import WebKit2.WebKit2_C;
import WebKit2.WKContextPrivate;
import WebKit2.WKEvent;
import WebKit2.WKURLCF;
import mBrowser.BrowserWindow;

extern(C) WKPageRef createNewPage( WKPageRef page, WKURLRequestRef request, WKDictionaryRef features, WKEventModifiers modifiers, WKEventMouseButton mouseButton, const(void)* clientInfo )
{
	auto browserWindow = new BrowserWindow();
	browserWindow.createWindow( 0, 0, 800, 600 );

	return WKViewGetPage( browserWindow.view.webView );

	return null;
}

extern(C) void showPage( WKPageRef page, const(void)* clientInfo )
{
	(cast(BrowserWindow)clientInfo).showWindow();
}

extern(C) void closePage( WKPageRef page, const(void)* clentInfo )
{
}

extern(C) void runJavaScriptAlert( WKPageRef page, WKStringRef alertText, WKFrameRef frame, const(void)* clientInfo )
{

}

extern(C) bool runJavaScriptConfirm( WKPageRef page, WKStringRef message, WKFrameRef frame, const(void)* clientInfo )
{
	return false;
}

extern(C) WKStringRef runJavaScriptPrompt( WKPageRef page, WKStringRef message, WKStringRef defaultValue, WKFrameRef frame, const(void)* clientInfo )
{
	return null;
}

extern(C) void setStatusText( WKPageRef page, WKStringRef text, const(void)* clientInfo )
{

}

extern(C) void mouseDidMoveOverElement( WKPageRef page, WKHitTestResultRef hitTestResult, WKEventModifiers modifiers, WKTypeRef userData, const(void)* clientInfo )
{
}

class BrowserView
{
	static shared WKContextRef context;

	shared static this()
	{
		context = cast(shared(WKContextRef))WKContextCreate();
	}

	void goToURL( wstring urlStr )
	{
		auto str = CFStringCreateWithCharacters( null, cast(const(UniChar)*)urlStr.ptr, urlStr.length );
		auto escapedString = CFURLCreateStringByAddingPercentEscapes( null, str, null, null, kCFStringEncodingUTF8 );
		CFRelease( str );
		auto cfURL = CFURLCreateWithString( null, escapedString, null );
		CFRelease( escapedString );
		auto url = WKURLCreateWithCFURL( cast(CFURLRef)cfURL );
		CFRelease( cfURL );

		auto page = WKViewGetPage( _web_view );
		WKPageLoadURL( page, url );
		WKRelease( url );
	}

	this( RECT webViewRect, BrowserWindow parentWindow )
	{
		enforce( null is _web_view );

		_web_view = WKViewCreate( webViewRect, cast(void*)context, null, parentWindow.window );

		WKPageUIClient uiClient = WKPageUIClient
		(
			kWKPageUIClientCurrentVersion,
			cast(void*)parentWindow,
			null,
			&showPage,
			&closePage,
			null,
			null,
			null,
			&.runJavaScriptAlert,
			&.runJavaScriptConfirm,
			&.runJavaScriptPrompt,
			&.setStatusText,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			&.createNewPage,
			&.mouseDidMoveOverElement,
			null,
			null,
			null,
			null,
		);
		WKPageSetPageUIClient( WKViewGetPage( _web_view ), &uiClient );

		WKViewSetIsInWindow( _web_view, true );
	}

	void setFrame( RECT rect )
	{
		auto webViewWindow = WKViewGetWindow( _web_view );
		SetWindowPos( webViewWindow, null, rect.left, rect.top, rect.right - rect.left, rect.bottom - rect.top
		            , SWP_NOZORDER | SWP_NOACTIVATE | SWP_NOCOPYBITS );
	}

	WKViewRef webView() { return _web_view; }

private:
	WKViewRef _web_view;
}
