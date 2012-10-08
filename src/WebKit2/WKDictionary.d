/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKDictionary;

import WebKit2.WKBase;

extern(C):

WKTypeID WKDictionaryGetTypeID();

WKTypeRef WKDictionaryGetItemForKey(WKDictionaryRef dictionary, WKStringRef key);
size_t WKDictionaryGetSize(WKDictionaryRef dictionary);

WKArrayRef WKDictionaryCopyKeys(WKDictionaryRef dictionary);

