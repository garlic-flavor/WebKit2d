/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKError;

import WebKit2.WKBase;

extern(C):

enum
{
    kWKErrorCodeCannotShowMIMEType =                             100,
    kWKErrorCodeCannotShowURL =                                  101,
    kWKErrorCodeFrameLoadInterruptedByPolicyChange =             102,
    kWKErrorCodeCannotUseRestrictedPort =                        103,
    kWKErrorCodeCannotFindPlugIn =                               200,
    kWKErrorCodeCannotLoadPlugIn =                               201,
    kWKErrorCodeJavaUnavailable =                                202,
    kWKErrorCodePlugInCancelledConnection =                      203,
    kWKErrorCodePlugInWillHandleLoad =                           204,
    kWKErrorCodeInsecurePlugInVersion =                          205,
}

alias uint WKErrorCode;

WKTypeID WKErrorGetTypeID();

WKStringRef WKErrorCopyWKErrorDomain();

WKStringRef WKErrorCopyDomain(WKErrorRef error);
int WKErrorGetErrorCode(WKErrorRef error);
WKURLRef WKErrorCopyFailingURL(WKErrorRef error);
WKStringRef WKErrorCopyLocalizedDescription(WKErrorRef error);
