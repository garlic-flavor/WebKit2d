/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKURL;

import WebKit2.WKBase;

extern(C):

WKTypeID WKURLGetTypeID();

WKURLRef WKURLCreateWithUTF8CString(const char* string);

WKStringRef WKURLCopyString(WKURLRef url);
WKStringRef WKURLCopyHostName(WKURLRef url);
WKStringRef WKURLCopyScheme(WKURLRef url);
WKStringRef WKURLCopyPath(WKURLRef url);
WKStringRef WKURLCopyLastPathComponent(WKURLRef url);

bool WKURLIsEqual(WKURLRef a, WKURLRef b);

