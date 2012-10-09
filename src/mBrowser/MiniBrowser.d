/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module mBrowser.MiniBrowser;

import mBrowser.BrowserWindow;
import win32.windows;

shared class MiniBrowser
{
	static shared MiniBrowser singleton;
	alias bool delegate( in ref MSG ) MessageHandler;

	shared static this()
	{
		singleton = new shared(MiniBrowser)();
	}

	void initialize( HINSTANCE hinst )
	{
		assert( null is _instance );
		_instance = cast(shared(void*))cast(uint)hinst;
	}

	void createNewWindow()
	{
		enum defaultURLString = "http://webkit.org/"w;
		auto browserWindow = new BrowserWindow();

		browserWindow.createWindow( 0, 0, 800, 600 );
		browserWindow.showWindow();
		browserWindow.goToURL( defaultURLString );
	}

	void registerHandler( MessageHandler handler )
	{
		_messageHandlers ~= handler;
	}

	void unregisterWindow( MessageHandler handler )
	{
		for( size_t i = 0 ; i < _messageHandlers.length ; i++ )
		{
			if( _messageHandlers[i] is handler )
			{
				_messageHandlers = _messageHandlers[ 0 .. i ] ~ _messageHandlers[ i+1 .. $ ];
				break;
			}
		}
		if( 0 == _messageHandlers.length ) PostQuitMessage(0);
	}

	bool handleMessage( ref in MSG msg )
	{
		foreach( one ; _messageHandlers )
		{
			if( one( msg ) ) return true;
		}
		return false;
	}

	HINSTANCE instance() { return cast(HINSTANCE)_instance; }

private:

	HINSTANCE _instance;
	MessageHandler[] _messageHandlers;
}
