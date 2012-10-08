/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module mBrowser.main;

import std.exception;
import core.runtime;
import win32.windows;
import mBrowser.BrowserWindow;
import mBrowser.MiniBrowser;
import mBrowser.BrowserView;

enum CLASS_NAME = "WebKit2WebViewWindowClass"w;

bool shouldTranslateMessage( ref in MSG msg )
{
	if( WM_KEYDOWN != msg.message && WM_SYSKEYDOWN != msg.message && WM_KEYUP != msg.message
	  && WM_SYSKEYUP != msg.message ) return true;

	wchar[256] className;
	int className_length;
	if( 0 == ( className_length = GetClassName( cast(void*)msg.hwnd, className.ptr, className.length ) ) )
		return true;

	return className[ 0 .. className_length ] != CLASS_NAME;
}

extern(Windows) bool DllMain( HINSTANCE dllInstance, uint reason, void* )
{
	switch( reason )
	{
		case        DLL_PROCESS_ATTACH:
			Runtime.initialize();
			MiniBrowser.singleton.initialize( dllInstance );
		break; case DLL_PROCESS_DETACH:
			Runtime.terminate;
		break; case DLL_THREAD_ATTACH:
			return false;
		break; case DLL_THREAD_DETACH:
			return false;
		break; default:
	}
	return true;
}

export int dllLauncherEntryPoint( )
{
	int result;
	try
	{
		MiniBrowser.singleton.createNewWindow();

		MSG message;
		while( 0 < (result = GetMessage( &message, null, 0, 0 ) ) )
		{
			if( shouldTranslateMessage(message) ) TranslateMessage( &message );
			if( !MiniBrowser.singleton.handleMessage( message ) ) DispatchMessage( &message );
		}
	}
	catch( Exception e )
	{
		MessageBoxA( null, (e.toString ~ "\0").ptr, "Exception".ptr, MB_OK );
	}
	return result;
}
