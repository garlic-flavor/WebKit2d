/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKPageLoadTypes;

enum {
    kWKFrameNavigationTypeLinkClicked = 0,
    kWKFrameNavigationTypeFormSubmitted = 1,
    kWKFrameNavigationTypeBackForward = 2,
    kWKFrameNavigationTypeReload = 3,
    kWKFrameNavigationTypeFormResubmitted = 4,
    kWKFrameNavigationTypeOther = 5
}
alias uint WKFrameNavigationType;

enum {
    kWKSameDocumentNavigationAnchorNavigation,
    kWKSameDocumentNavigationSessionStatePush,
    kWKSameDocumentNavigationSessionStateReplace,
    kWKSameDocumentNavigationSessionStatePop
}
alias uint WKSameDocumentNavigationType;

enum {
    kWKDidFirstLayout = 1 << 0,
    kWKDidFirstVisuallyNonEmptyLayout = 1 << 1,
    kWKDidHitRelevantRepaintedObjectsAreaThreshold = 1 << 2
}
alias uint WKLayoutMilestones;


