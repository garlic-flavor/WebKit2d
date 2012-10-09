/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKMutableArray;

import WebKit2.WKBase;

extern(C):

WKMutableArrayRef WKMutableArrayCreate();

bool WKArrayIsMutable(WKArrayRef array);

void WKArrayAppendItem(WKMutableArrayRef array, WKTypeRef item);

void WKArrayRemoveItemAtIndex(WKMutableArrayRef array, size_t index);

