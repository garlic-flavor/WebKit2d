/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKPageLoadTypes;

enum WKFrameNavigationType{
    kWKFrameNavigationTypeLinkClicked = 0,
    kWKFrameNavigationTypeFormSubmitted = 1,
    kWKFrameNavigationTypeBackForward = 2,
    kWKFrameNavigationTypeReload = 3,
    kWKFrameNavigationTypeFormResubmitted = 4,
    kWKFrameNavigationTypeOther = 5
}

enum WKSameDocumentNavigationType{
    kWKSameDocumentNavigationAnchorNavigation,
    kWKSameDocumentNavigationSessionStatePush,
    kWKSameDocumentNavigationSessionStateReplace,
    kWKSameDocumentNavigationSessionStatePop
}

