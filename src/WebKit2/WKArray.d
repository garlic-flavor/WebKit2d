/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKArray;

import WebKit2.WKBase;

extern(C):

WKTypeID WKArrayGetTypeID();

WKArrayRef WKArrayCreate( WKTypeRef*, size_t );

WKTypeRef WKArrayGetItemAtIndex( WKArrayRef, size_t );
size_t WKArrayGetSize( WKArrayRef );
