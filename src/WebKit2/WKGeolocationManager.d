/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKGeolocationManager;

import WebKit2.WKBase;

extern(C):

alias extern(C) void function(WKGeolocationManagerRef geolocationManager, const void* clientInfo) WKGeolocationProviderStartUpdatingCallback;
alias extern(C) void function(WKGeolocationManagerRef geolocationManager, const void* clientInfo) WKGeolocationProviderStopUpdatingCallback;

struct WKGeolocationProvider
{
    int                                                                 _version;
    const void *                                                        clientInfo;
    WKGeolocationProviderStartUpdatingCallback                          startUpdating;
    WKGeolocationProviderStopUpdatingCallback                           stopUpdating;
}

enum kWKGeolocationProviderCurrentVersion = 0;

WKTypeID WKGeolocationManagerGetTypeID();

void WKGeolocationManagerSetProvider(WKGeolocationManagerRef geolocationManager, const(WKGeolocationProvider)* provider);

void WKGeolocationManagerProviderDidChangePosition(WKGeolocationManagerRef geolocationManager, WKGeolocationPositionRef position);
void WKGeolocationManagerProviderDidFailToDeterminePosition(WKGeolocationManagerRef geolocationManager);

void WKGeolocationManagerProviderDidFailToDeterminePositionWithErrorMessage(WKGeolocationManagerRef geolocationManager, WKStringRef errorMessage);
