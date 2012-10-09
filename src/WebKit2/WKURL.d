/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
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

