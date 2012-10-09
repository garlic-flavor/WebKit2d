/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKMutableDictionary;

import WebKit2.WKBase;

extern(C):

WKMutableDictionaryRef WKMutableDictionaryCreate();

bool WKDictionaryIsMutable(WKDictionaryRef dictionary);

bool WKDictionaryAddItem(WKMutableDictionaryRef dictionary, WKStringRef key, WKTypeRef item);
bool WKDictionarySetItem(WKMutableDictionaryRef dictionary, WKStringRef key, WKTypeRef item);
void WKDictionaryRemoveItem(WKMutableDictionaryRef dictionary, WKStringRef key);
