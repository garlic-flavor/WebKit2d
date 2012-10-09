/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKOpenPanelResultListener;

import WebKit2.WKBase;

extern(C):

WKTypeID WKOpenPanelResultListenerGetTypeID();

void WKOpenPanelResultListenerChooseFiles(WKOpenPanelResultListenerRef listener, WKArrayRef fileURLs);
void WKOpenPanelResultListenerCancel(WKOpenPanelResultListenerRef listener);

