/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKGeolocationPosition;

import WebKit2.WKBase;

extern(C):

WKTypeID WKGeolocationPositionGetTypeID();

WKGeolocationPositionRef WKGeolocationPositionCreate(double timestamp, double latitude, double longitude, double accuracy);

WKGeolocationPositionRef WKGeolocationPositionCreate_b(double timestamp, double latitude, double longitude, double accuracy, bool providesAltitude, double altitude, bool providesAltitudeAccuracy, double altitudeAccuracy, bool providesHeading, double heading, bool providesSpeed, double speed);
