/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKData;

import WebKit2.WKBase;

extern(C):

WKTypeID WKDataGetTypeID();

WKDataRef WKDataCreate(const(char)* bytes, size_t size);

const(ubyte)* WKDataGetBytes(WKDataRef data);
size_t WKDataGetSize(WKDataRef data);

