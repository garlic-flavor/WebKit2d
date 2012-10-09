/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKPageGroup;

import WebKit2.WKBase;

extern(C):

WKTypeID WKPageGroupGetTypeID();

WKPageGroupRef WKPageGroupCreateWithIdentifier(WKStringRef identifier);

WKStringRef WKPageGroupCopyIdentifier(WKPageGroupRef pageGroup);

void WKPageGroupSetPreferences(WKPageGroupRef pageGroup, WKPreferencesRef preferences);
WKPreferencesRef WKPageGroupGetPreferences(WKPageGroupRef pageGroup);

