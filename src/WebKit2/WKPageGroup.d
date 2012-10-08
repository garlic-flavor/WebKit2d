/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
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

