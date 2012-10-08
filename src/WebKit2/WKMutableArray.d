/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKMutableArray;

import WebKit2.WKBase;


WKMutableArrayRef WKMutableArrayCreate();

bool WKArrayIsMutable(WKArrayRef array);

void WKArrayAppendItem(WKMutableArrayRef array, WKTypeRef item);

void WKArrayRemoveItemAtIndex(WKMutableArrayRef array, size_t index);

