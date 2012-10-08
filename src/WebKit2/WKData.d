/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKData;

import WebKit2.WKBase;

extern(C):

WKTypeID WKDataGetTypeID();

WKDataRef WKDataCreate(const(char)* bytes, size_t size);

const(char)* WKDataGetBytes(WKDataRef data);
size_t WKDataGetSize(WKDataRef data);

