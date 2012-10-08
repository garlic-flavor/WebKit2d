/** 自身(.exeファイル)と同名の .dll 内の関数、dllLauncherEntryPoint() を呼び出す。
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:19:49
 * Authors:      KUMA
 * License:      CC0
*/
module DLLLauncher.DLLLauncherMain;

import core.runtime;
import std.exception, std.path, std.utf;
import win32.windows, win32.winreg;

//
class ExceptionW : Exception
{
	wstring programName;
	wstring messageW;
	this( const(wchar)[] programName, const(wchar)[] msg, string file = __FILE__, size_t line = __LINE__ )
	{
		this.programName = programName.idup;
		this.messageW = msg.idup;
		super( msg.toUTF8, file, line );
	}
}


//
T enforceW(T)( T val, const(wchar)[] programName, const(wchar)[] msg = "enforceW" )
{
	if( val ) return val;
	else throw new ExceptionW( programName, msg );
	assert(0);
}

//
size_t length(T)( in T* str ) { size_t i; for( i = 0 ; '\0' != str[i] ; i++ ) { } return i; }

// なにこれ?
void enableTerminationOnHeapCorruption()
{
	auto heapEnableTerminationOnCorruption = cast(HEAP_INFORMATION_CLASS)1;

	auto mod = enforce( cast(HANDLE) Runtime.loadLibrary( "kernel32.dll" ), "Runtime.loadLibrary failed" );
	scope( exit ) Runtime.unloadLibrary( mod );

	alias extern(C) bool function( HANDLE, HEAP_INFORMATION_CLASS, void*, size_t ) HSI;
	auto heapSetInformation = enforce( cast(HSI)GetProcAddress( mod, "HeapSetInformation" ) );

	(*heapSetInformation)( null, heapEnableTerminationOnCorruption, null, 0 );
}

// レジストリの値を読み取る
wstring applePathFromRegistry( in wchar* key, in wchar* value )
{
	wstring getStringValue( HKEY key, in wchar* valueName )
	{
		uint type = 0;
		uint bufferSize = 0;
		if( ERROR_SUCCESS != RegQueryValueEx( key, valueName, null, &type, null, &bufferSize ) || REG_SZ != REG_SZ )
			return "";

		auto buffer = new wchar[ bufferSize / wchar.sizeof ];
		if( ERROR_SUCCESS != RegQueryValueEx( key, valueName, null, &type, cast(ubyte*)buffer.ptr, &bufferSize ) )
			return "";
		return buffer[ 0 .. $-1].assumeUnique;
	}

	HKEY applePathKey = null;
	if( ERROR_SUCCESS != RegOpenKeyEx( HKEY_LOCAL_MACHINE, key, 0, KEY_READ, &applePathKey ) )
		return "";
	scope( exit ) RegCloseKey( applePathKey );
	return getStringValue( applePathKey, value );
}

// Apple Application Support がインストールされているフォルダを探す。
wstring appleApplicationSupportDirectory()
{
	return applePathFromRegistry( "SOFTWARE\\Apple Inc.\\Apple Application Support"w.ptr, "InstallDir"w.ptr );
}

// 環境変数の値を返す
wstring copyEnvironmentVariable( in wchar* variable )
{
	uint length = GetEnvironmentVariable( variable, null, 0 );
	if( 0 == length ) return "";
	auto buffer = new wchar[ length ];
	if( 0 == GetEnvironmentVariable( variable, buffer.ptr, buffer.length * wchar.sizeof ) || '\0' == buffer[0] )
		return "";
	return buffer[ 0 .. $-1 ].assumeUnique;
}

// 環境変数 PATH の先頭にパスを追加する。
bool prependPath( wstring directoryToPrepend )
{
	auto pathVariable = "PATH"w.ptr;
	auto oldPath = copyEnvironmentVariable( pathVariable );
	auto newPath = ( directoryToPrepend ~ ";" ~ oldPath ~ "\0").idup.ptr;
	return 0 < SetEnvironmentVariable( pathVariable, newPath );
}

// Apple Application Support がインストールされているフォルダを環境変数 PATH に追加する。
void modifyPath( const(wchar)[] programName )
{
	struct Products
	{
		wstring softwareSubKey;
		wstring productName;
	}
	auto products = [ Products( "Apple Inc."w, "Apple Application Support"w )
	                , Products( "Apple Computer, Inc."w, "Safari"w ) ];
	wstring pathPrefix;
	foreach( i, one ; products )
	{
		auto directory = enforceW( applePathFromRegistry( ("SOFTWARE\\"w ~ one.softwareSubKey ~ "\\"w
		                                                  ~ one.productName ~ "\0"w).idup.ptr, "InstallDir"w.ptr )
		                         , programName, "Failed to determine path to "w ~ one.productName ~ " directory."w );

		if( 0 < i ) pathPrefix ~= ";"w;
		pathPrefix ~= directory;
	}

	enforceW( pathPrefix.prependPath, programName, "Failed to modify PATH environment variable." );
}

//
int main()
{
	try
	{
		enableTerminationOnHeapCorruption();

		auto thisPath = new wchar[ MAX_PATH ];
		enforce( GetModuleFileName( null, thisPath.ptr, thisPath.length ), "GetModuleFileName failed." );

		auto programName = thisPath.ptr[ 0 .. length(thisPath.ptr) ].baseName( ".exe" );

		modifyPath( programName );

		auto exePath = thisPath.setExtension( "dll"w );

		auto mod = enforceW( Runtime.loadLibrary( exePath.toUTF8 ), programName, "LoadLibrary failed" );
		alias int function( ) EntryPoint;

		// ？ なんでやねん。
		debug
			auto entryPointName = "D8mBrowser4main21dllLauncherEntryPointFZi".ptr;
		else
			auto entryPointName = "_D8mBrowser4main21dllLauncherEntryPointFZi".ptr;

		auto entryPoint = enforceW( cast(EntryPoint)GetProcAddress( mod, entryPointName )
		                          , programName, "Failed to find dllLauncherEntryPoint function." );
		return (*entryPoint)( );
	}
	catch( ExceptionW e )
	{
		MessageBox( null, (e.messageW ~ "\0"w).ptr, (e.programName ~ "\0"w).ptr, MB_OK );
		return 1;
	}
	catch( Exception e )
	{
		MessageBoxA( null, ( e.toString ~ "\0" ).ptr, "DLLLauncher".ptr, MB_OK );
		return 1;
	}
	return 0;
}
