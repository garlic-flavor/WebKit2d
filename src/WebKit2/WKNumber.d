/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKNumber;

import WebKit2.WKBase;

extern(C):

/* WKBoolean */
WKTypeID WKBooleanGetTypeID();
WKBooleanRef WKBooleanCreate(bool value);
bool WKBooleanGetValue(WKBooleanRef booleanRef);

/* WKDouble */
WKTypeID WKDoubleGetTypeID();
WKDoubleRef WKDoubleCreate(double value);
double WKDoubleGetValue(WKDoubleRef doubleRef);

/* WKUInt64 */
WKTypeID WKUInt64GetTypeID();
WKUInt64Ref WKUInt64Create(ulong value);
ulong WKUInt64GetValue(WKUInt64Ref integerRef);

