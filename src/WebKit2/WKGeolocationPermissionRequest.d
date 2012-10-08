/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKGeolocationPermissionRequest;

import WebKit2.WKBase;

extern(C):

WKTypeID WKGeolocationPermissionRequestGetTypeID();

void WKGeolocationPermissionRequestAllow(WKGeolocationPermissionRequestRef geolocationPermissionRequest);
void WKGeolocationPermissionRequestDeny(WKGeolocationPermissionRequestRef geolocationPermissionRequest);

