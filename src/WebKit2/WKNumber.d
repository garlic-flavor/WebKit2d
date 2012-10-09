/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKNumber;

import WebKit2.WKBase;

extern(C):

WKTypeID WKBooleanGetTypeID();
WKBooleanRef WKBooleanCreate(bool value);
bool WKBooleanGetValue(WKBooleanRef booleanRef);

WKTypeID WKDoubleGetTypeID();
WKDoubleRef WKDoubleCreate(double value);
double WKDoubleGetValue(WKDoubleRef doubleRef);

WKTypeID WKUInt64GetTypeID();
WKUInt64Ref WKUInt64Create(ulong value);
ulong WKUInt64GetValue(WKUInt64Ref integerRef);

