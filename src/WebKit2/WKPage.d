/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKPage;

import WebKit2.WKBase;
import WebKit2.WKError;
import WebKit2.WKEvent;
import WebKit2.WKFindOptions;
import WebKit2.WKGeometry;
import WebKit2.WKNativeEvent;
import WebKit2.WKPageLoadTypes;

extern(C):

enum
{
    kWKFocusDirectionBackward = 0,
    kWKFocusDirectionForward = 1
}
alias uint WKFocusDirection;

alias extern(C) void function(WKPageRef page, const(void)* clientInfo) WKPageCallback;

// FrameLoad Client
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidStartProvisionalLoadForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidReceiveServerRedirectForProvisionalLoadForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKErrorRef error, WKTypeRef userData, const(void)* clientInfo) WKPageDidFailProvisionalLoadWithErrorForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidCommitLoadForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidFinishDocumentLoadForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidFinishLoadForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKErrorRef error, WKTypeRef userData, const(void)* clientInfo) WKPageDidFailLoadWithErrorForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKSameDocumentNavigationType type, WKTypeRef userData, const(void)* clientInfo) WKPageDidSameDocumentNavigationForFrameCallback;
alias extern(C) void function(WKPageRef page, WKStringRef title, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidReceiveTitleForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidFirstLayoutForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidFirstVisuallyNonEmptyLayoutForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidRemoveFrameFromHierarchyCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidDisplayInsecureContentForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidRunInsecureContentForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKTypeRef userData, const(void)* clientInfo) WKPageDidDetectXSSForFrameCallback;
alias extern(C) bool function(WKPageRef page, WKFrameRef frame, WKProtectionSpaceRef protectionSpace, const(void)* clientInfo) WKPageCanAuthenticateAgainstProtectionSpaceInFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKAuthenticationChallengeRef authenticationChallenge, const(void)* clientInfo) WKPageDidReceiveAuthenticationChallengeInFrameCallback;
alias extern(C) void function(WKPageRef page, WKBackForwardListItemRef addedItem, WKArrayRef removedItems, const(void)* clientInfo) WKPageDidChangeBackForwardListCallback;
alias extern(C) bool function(WKPageRef page, WKBackForwardListItemRef item, const(void)* clientInfo) WKPageShouldGoToBackForwardListItemCallback;
alias extern(C) void function(WKPageRef page, WKTypeRef userData, const(void)* clientInfo) WKPageDidNewFirstVisuallyNonEmptyLayoutCallback;
alias extern(C) void function(WKPageRef page, WKBackForwardListItemRef item, WKTypeRef userData, const(void)* clientInfo) WKPageWillGoToBackForwardListItemCallback;
alias extern(C) void function(WKPageRef page, WKErrorCode errorCode, WKStringRef mimeType, WKStringRef pluginIdentifier, WKStringRef pluginVersion, const void* clientInfo) WKPagePluginDidFailCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKIntentDataRef intent, WKTypeRef userData, const(void)* clientInfo) WKPageDidReceiveIntentForFrameCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKIntentServiceInfoRef serviceInfo, WKTypeRef userData, const(void)* clientInfo) WKPageRegisterIntentServiceForFrameCallback;
alias extern(C) void function(WKPageRef page, WKLayoutMilestones milestones, WKTypeRef userData, const(void)* clientInfo) WKPageDidLayoutCallback;

// Deprecated
alias extern(C) void function(WKPageRef page, WKStringRef mimeType, const void* clientInfo) WKPageDidFailToInitializePluginCallback_deprecatedForUseWithV0;


struct WKPageLoaderClient {
    int                                                                 _version;
    const void *                                                        clientInfo;
    WKPageDidStartProvisionalLoadForFrameCallback                       didStartProvisionalLoadForFrame;
    WKPageDidReceiveServerRedirectForProvisionalLoadForFrameCallback    didReceiveServerRedirectForProvisionalLoadForFrame;
    WKPageDidFailProvisionalLoadWithErrorForFrameCallback               didFailProvisionalLoadWithErrorForFrame;
    WKPageDidCommitLoadForFrameCallback                                 didCommitLoadForFrame;
    WKPageDidFinishDocumentLoadForFrameCallback                         didFinishDocumentLoadForFrame;
    WKPageDidFinishLoadForFrameCallback                                 didFinishLoadForFrame;
    WKPageDidFailLoadWithErrorForFrameCallback                          didFailLoadWithErrorForFrame;
    WKPageDidSameDocumentNavigationForFrameCallback                     didSameDocumentNavigationForFrame;
    WKPageDidReceiveTitleForFrameCallback                               didReceiveTitleForFrame;
    WKPageDidFirstLayoutForFrameCallback                                didFirstLayoutForFrame;
    WKPageDidFirstVisuallyNonEmptyLayoutForFrameCallback                didFirstVisuallyNonEmptyLayoutForFrame;
    WKPageDidRemoveFrameFromHierarchyCallback                           didRemoveFrameFromHierarchy;
    WKPageDidDisplayInsecureContentForFrameCallback                     didDisplayInsecureContentForFrame;
    WKPageDidRunInsecureContentForFrameCallback                         didRunInsecureContentForFrame;
    WKPageCanAuthenticateAgainstProtectionSpaceInFrameCallback          canAuthenticateAgainstProtectionSpaceInFrame;
    WKPageDidReceiveAuthenticationChallengeInFrameCallback              didReceiveAuthenticationChallengeInFrame;

    // FIXME: Move to progress client.
    WKPageCallback                                                      didStartProgress;
    WKPageCallback                                                      didChangeProgress;
    WKPageCallback                                                      didFinishProgress;

    // FIXME: These three functions should not be part of this client.
    WKPageCallback                                                      processDidBecomeUnresponsive;
    WKPageCallback                                                      processDidBecomeResponsive;
    WKPageCallback                                                      processDidCrash;
    WKPageDidChangeBackForwardListCallback                              didChangeBackForwardList;
    WKPageShouldGoToBackForwardListItemCallback                         shouldGoToBackForwardListItem;
    WKPageDidFailToInitializePluginCallback_deprecatedForUseWithV0      didFailToInitializePlugin_deprecatedForUseWithV0;

    // Version 1
    WKPageDidDetectXSSForFrameCallback                                  didDetectXSSForFrame;

    // FIXME: didFirstVisuallyNonEmptyLayoutForFrame and didNewFirstVisuallyNonEmptyLayout should be merged.
    WKPageDidNewFirstVisuallyNonEmptyLayoutCallback                     didNewFirstVisuallyNonEmptyLayout;

    WKPageWillGoToBackForwardListItemCallback                           willGoToBackForwardListItem;

    WKPageCallback                                                      interactionOccurredWhileProcessUnresponsive;
    WKPagePluginDidFailCallback                                         pluginDidFail;

    // Version 2
    WKPageDidReceiveIntentForFrameCallback                              didReceiveIntentForFrame;
    WKPageRegisterIntentServiceForFrameCallback                         registerIntentServiceForFrame;

    WKPageDidLayoutCallback                                             didLayout;
}

enum kWKPageLoaderClientCurrentVersion = 2;

// Policy Client.
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKFrameNavigationType navigationType, WKEventModifiers modifiers, WKEventMouseButton mouseButton, WKURLRequestRef request, WKFramePolicyListenerRef listener, WKTypeRef userData, const void* clientInfo) WKPageDecidePolicyForNavigationActionCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKFrameNavigationType navigationType, WKEventModifiers modifiers, WKEventMouseButton mouseButton, WKURLRequestRef request, WKStringRef frameName, WKFramePolicyListenerRef listener, WKTypeRef userData, const void* clientInfo) WKPageDecidePolicyForNewWindowActionCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKURLResponseRef response, WKURLRequestRef request, WKFramePolicyListenerRef listener, WKTypeRef userData, const void* clientInfo) WKPageDecidePolicyForResponseCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKErrorRef error, WKTypeRef userData, const void* clientInfo) WKPageUnableToImplementPolicyCallback;

struct WKPagePolicyClient
{
    int                                                                 _version;
    const void *                                                        clientInfo;
    WKPageDecidePolicyForNavigationActionCallback                       decidePolicyForNavigationAction;
    WKPageDecidePolicyForNewWindowActionCallback                        decidePolicyForNewWindowAction;
    WKPageDecidePolicyForResponseCallback                               decidePolicyForResponse;
    WKPageUnableToImplementPolicyCallback                               unableToImplementPolicy;
}

enum kWKPagePolicyClientCurrentVersion = 0;

// Form Client.
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKFrameRef sourceFrame, WKDictionaryRef values, WKTypeRef userData, WKFormSubmissionListenerRef listener, const void* clientInfo) WKPageWillSubmitFormCallback;

struct WKPageFormClient
{
    int                                                                 _version;
    const(void)*                                                        clientInfo;
    WKPageWillSubmitFormCallback                                        willSubmitForm;
}

enum kWKPageFormClientCurrentVersion = 0;

// Resource Load Client.
alias extern(C) void function(WKPageRef page, WKFrameRef frame, ulong resourceIdentifier, WKURLRequestRef request, bool pageIsProvisionallyLoading, const void* clientInfo) WKPageDidInitiateLoadForResourceCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, ulong resourceIdentifier, WKURLRequestRef request, WKURLResponseRef redirectResponse, const void* clientInfo) WKPageDidSendRequestForResourceCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, ulong resourceIdentifier, WKURLResponseRef response, const void* clientInfo) WKPageDidReceiveResponseForResourceCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, ulong resourceIdentifier, ulong contentLength, const void* clientInfo) WKPageDidReceiveContentLengthForResourceCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, ulong resourceIdentifier, const void* clientInfo) WKPageDidFinishLoadForResourceCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, ulong resourceIdentifier, WKErrorRef error, const void* clientInfo) WKPageDidFailLoadForResourceCallback;


struct WKPageResourceLoadClient {
    int                                                                 _version;
    const(void)*                                                        clientInfo;
    WKPageDidInitiateLoadForResourceCallback                            didInitiateLoadForResource;
    WKPageDidSendRequestForResourceCallback                             didSendRequestForResource;
    WKPageDidReceiveResponseForResourceCallback                         didReceiveResponseForResource;
    WKPageDidReceiveContentLengthForResourceCallback                    didReceiveContentLengthForResource;
    WKPageDidFinishLoadForResourceCallback                              didFinishLoadForResource;
    WKPageDidFailLoadForResourceCallback                                didFailLoadForResource;
}

enum kWKPageResourceLoadClientCurrentVersion = 0;

enum
{
    kWKPluginUnavailabilityReasonPluginMissing,
    kWKPluginUnavailabilityReasonPluginCrashed,
    kWKPluginUnavailabilityReasonInsecurePluginVersion
}
alias uint WKPluginUnavailabilityReason;

// UI Client
alias extern(C) WKPageRef function(WKPageRef page, WKURLRequestRef urlRequest, WKDictionaryRef features, WKEventModifiers modifiers, WKEventMouseButton mouseButton, const(void)* clientInfo) WKPageCreateNewPageCallback;
alias extern(C) void function(WKPageRef page, WKStringRef alertText, WKFrameRef frame, const(void)* clientInfo) WKPageRunJavaScriptAlertCallback;
alias extern(C) bool function(WKPageRef page, WKStringRef message, WKFrameRef frame, const(void)* clientInfo) WKPageRunJavaScriptConfirmCallback;
alias extern(C) WKStringRef function(WKPageRef page, WKStringRef message, WKStringRef defaultValue, WKFrameRef frame, const(void)* clientInfo) WKPageRunJavaScriptPromptCallback;
alias extern(C) void function(WKPageRef page, WKFocusDirection direction, const(void)* clientInfo) WKPageTakeFocusCallback;
alias extern(C) void function(WKPageRef page, const(void)* clientInfo) WKPageFocusCallback;
alias extern(C) void function(WKPageRef page, const(void)* clientInfo) WKPageUnfocusCallback;
alias extern(C) void function(WKPageRef page, WKStringRef text, const(void)* clientInfo) WKPageSetStatusTextCallback;
alias extern(C) void function(WKPageRef page, WKHitTestResultRef hitTestResult, WKEventModifiers modifiers, WKTypeRef userData, const(void)* clientInfo) WKPageMouseDidMoveOverElementCallback;
alias extern(C) void function(WKPageRef page, WKNativeEventPtr event, const(void)* clientInfo) WKPageDidNotHandleKeyEventCallback;
alias extern(C) void function(WKPageRef page, WKNativeEventPtr event, const(void)* clientInfo) WKPageDidNotHandleWheelEventCallback;
alias extern(C) bool function(WKPageRef page, const(void)* clientInfo) WKPageGetToolbarsAreVisibleCallback;
alias extern(C) void function(WKPageRef page, bool toolbarsVisible, const(void)* clientInfo) WKPageSetToolbarsAreVisibleCallback;
alias extern(C) bool function(WKPageRef page, const(void)* clientInfo) WKPageGetMenuBarIsVisibleCallback;
alias extern(C) void function(WKPageRef page, bool menuBarVisible, const(void)* clientInfo) WKPageSetMenuBarIsVisibleCallback;
alias extern(C) bool function(WKPageRef page, const(void)* clientInfo) WKPageGetStatusBarIsVisibleCallback;
alias extern(C) void function(WKPageRef page, bool statusBarVisible, const(void)* clientInfo) WKPageSetStatusBarIsVisibleCallback;
alias extern(C) bool function(WKPageRef page, const(void)* clientInfo) WKPageGetIsResizableCallback;
alias extern(C) void function(WKPageRef page, bool resizable, const(void)* clientInfo) WKPageSetIsResizableCallback;
alias extern(C) WKRect function(WKPageRef page, const(void)* clientInfo) WKPageGetWindowFrameCallback;
alias extern(C) void function(WKPageRef page, WKRect frame, const(void)* clientInfo) WKPageSetWindowFrameCallback;
alias extern(C) bool function(WKPageRef page, WKStringRef message, WKFrameRef frame, const(void)* clientInfo) WKPageRunBeforeUnloadConfirmPanelCallback;
alias extern(C) ulong function(WKPageRef page, WKFrameRef frame, WKSecurityOriginRef origin, WKStringRef databaseName, WKStringRef displayName, ulong currentQuota, ulong currentOriginUsage, ulong currentDatabaseUsage, ulong expectedUsage, const(void)* clientInfo) WKPageExceededDatabaseQuotaCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKOpenPanelParametersRef parameters, WKOpenPanelResultListenerRef listener, const(void)* clientInfo) WKPageRunOpenPanelCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKSecurityOriginRef origin, WKGeolocationPermissionRequestRef permissionRequest, const void* clientInfo) WKPageDecidePolicyForGeolocationPermissionRequestCallback;
alias extern(C) float function(WKPageRef page, WKFrameRef frame, const void* clientInfo) WKPageHeaderHeightCallback;
alias extern(C) float function(WKPageRef page, WKFrameRef frame, const void* clientInfo) WKPageFooterHeightCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKRect rect, const void* clientInfo) WKPageDrawHeaderCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, WKRect rect, const void* clientInfo) WKPageDrawFooterCallback;
alias extern(C) void function(WKPageRef page, WKFrameRef frame, const void* clientInfo) WKPagePrintFrameCallback;
alias extern(C) void function(WKPageRef page, WKStringRef suggestedFilename, WKStringRef mimeType, WKURLRef originatingURL, WKDataRef data, const void* clientInfo) WKPageSaveDataToFileInDownloadsFolderCallback;
alias extern(C) bool function(WKPageRef page, const(void)* clientInfo) WKPageShouldInterruptJavaScriptCallback;
alias extern(C) void function(WKPageRef page, WKSecurityOriginRef origin, WKNotificationPermissionRequestRef permissionRequest, const(void)* clientInfo) WKPageDecidePolicyForNotificationPermissionRequestCallback;
alias extern(C) void function(WKPageRef page, WKPluginUnavailabilityReason pluginUnavailabilityReason, WKStringRef mimeType, WKStringRef url, WKStringRef pluginsPageURL, const void* clientInfo) WKPageUnavailablePluginButtonClickedCallback;
alias extern(C) void function(WKPageRef page, WKStringRef initialColor, WKColorPickerResultListenerRef listener, const void* clientInfo) WKPageShowColorPickerCallback;
alias extern(C) void function(WKPageRef page, const void* clientInfo) WKPageHideColorPickerCallback;

// Deprecated    
alias extern(C) WKPageRef function(WKPageRef page, WKDictionaryRef features, WKEventModifiers modifiers, WKEventMouseButton mouseButton, const(void)* clientInfo) WKPageCreateNewPageCallback_deprecatedForUseWithV0;
alias extern(C) void      function(WKPageRef page, WKEventModifiers modifiers, WKTypeRef userData, const(void)* clientInfo) WKPageMouseDidMoveOverElementCallback_deprecatedForUseWithV0;
alias extern(C) void function(WKPageRef page, WKStringRef mimeType, WKStringRef url, WKStringRef pluginsPageURL, const void* clientInfo) WKPageMissingPluginButtonClickedCallback_deprecatedForUseWithV0;

struct WKPageUIClient {
    int                                                                 _version;
    const(void)*                                                        clientInfo;

    // Version 0
    WKPageCreateNewPageCallback_deprecatedForUseWithV0                  createNewPage_deprecatedForUseWithV0;
    WKPageCallback                                                      showPage;
    WKPageCallback                                                      close;
    WKPageTakeFocusCallback                                             takeFocus;
    WKPageFocusCallback                                                 focus;
    WKPageUnfocusCallback                                               unfocus;
    WKPageRunJavaScriptAlertCallback                                    runJavaScriptAlert;
    WKPageRunJavaScriptConfirmCallback                                  runJavaScriptConfirm;
    WKPageRunJavaScriptPromptCallback                                   runJavaScriptPrompt;
    WKPageSetStatusTextCallback                                         setStatusText;
    WKPageMouseDidMoveOverElementCallback_deprecatedForUseWithV0        mouseDidMoveOverElement_deprecatedForUseWithV0;
    WKPageMissingPluginButtonClickedCallback_deprecatedForUseWithV0     missingPluginButtonClicked_deprecatedForUseWithV0;
    WKPageDidNotHandleKeyEventCallback                                  didNotHandleKeyEvent;
    WKPageDidNotHandleWheelEventCallback                                didNotHandleWheelEvent;
    WKPageGetToolbarsAreVisibleCallback                                 toolbarsAreVisible;
    WKPageSetToolbarsAreVisibleCallback                                 setToolbarsAreVisible;
    WKPageGetMenuBarIsVisibleCallback                                   menuBarIsVisible;
    WKPageSetMenuBarIsVisibleCallback                                   setMenuBarIsVisible;
    WKPageGetStatusBarIsVisibleCallback                                 statusBarIsVisible;
    WKPageSetStatusBarIsVisibleCallback                                 setStatusBarIsVisible;
    WKPageGetIsResizableCallback                                        isResizable;
    WKPageSetIsResizableCallback                                        setIsResizable;
    WKPageGetWindowFrameCallback                                        getWindowFrame;
    WKPageSetWindowFrameCallback                                        setWindowFrame;
    WKPageRunBeforeUnloadConfirmPanelCallback                           runBeforeUnloadConfirmPanel;
    WKPageCallback                                                      didDraw;
    WKPageCallback                                                      pageDidScroll;
    WKPageExceededDatabaseQuotaCallback                                 exceededDatabaseQuota;
    WKPageRunOpenPanelCallback                                          runOpenPanel;
    WKPageDecidePolicyForGeolocationPermissionRequestCallback           decidePolicyForGeolocationPermissionRequest;
    WKPageHeaderHeightCallback                                          headerHeight;
    WKPageFooterHeightCallback                                          footerHeight;
    WKPageDrawHeaderCallback                                            drawHeader;
    WKPageDrawFooterCallback                                            drawFooter;
    WKPagePrintFrameCallback                                            printFrame;
    WKPageCallback                                                      runModal;
    void*                                                               unused1; // Used to be didCompleteRubberBandForMainFrame
    WKPageSaveDataToFileInDownloadsFolderCallback                       saveDataToFileInDownloadsFolder;
    WKPageShouldInterruptJavaScriptCallback                             shouldInterruptJavaScript;    

    // Version 1
    WKPageCreateNewPageCallback                                         createNewPage;
    WKPageMouseDidMoveOverElementCallback                               mouseDidMoveOverElement;
    WKPageDecidePolicyForNotificationPermissionRequestCallback          decidePolicyForNotificationPermissionRequest;
    WKPageUnavailablePluginButtonClickedCallback                        unavailablePluginButtonClicked;

    // Version 2
    WKPageShowColorPickerCallback                                       showColorPicker;
    WKPageHideColorPickerCallback                                       hideColorPicker;
}

enum kWKPageUIClientCurrentVersion = 2;


// Find client.
alias extern(C) void function(WKPageRef page, WKStringRef string, uint matchCount, const void* clientInfo) WKPageDidFindStringCallback;
alias extern(C) void function(WKPageRef page, WKStringRef string, const void* clientInfo) WKPageDidFailToFindStringCallback;
alias extern(C) void function(WKPageRef page, WKStringRef string, uint matchCount, const void* clientInfo) WKPageDidCountStringMatchesCallback;


struct WKPageFindClient {
    int                                                                 _version;
    const void *                                                        clientInfo;
    WKPageDidFindStringCallback                                         didFindString;
    WKPageDidFailToFindStringCallback                                   didFailToFindString;
    WKPageDidCountStringMatchesCallback                                 didCountStringMatches;
}

enum kWKPageFindClientCurrentVersion = 0;

enum kWKMoreThanMaximumMatchCount = -1;

// ContextMenu client
alias extern(C) void function(WKPageRef page, WKArrayRef proposedMenu, WKArrayRef* newMenu, WKHitTestResultRef hitTestResult, WKTypeRef userData, const void* clientInfo) WKPageGetContextMenuFromProposedContextMenuCallback;
alias extern(C) void function(WKPageRef page, WKContextMenuItemRef contextMenuItem, const void* clientInfo) WKPageCustomContextMenuItemSelectedCallback;
alias extern(C) void function(WKPageRef page, const void* clientInfo) WKPageContextMenuDismissedCallback;

// Deprecated
alias extern(C) void function(WKPageRef page, WKArrayRef proposedMenu, WKArrayRef* newMenu, WKTypeRef userData, const void* clientInfo) WKPageGetContextMenuFromProposedContextMenuCallback_deprecatedForUseWithV0;

struct WKPageContextMenuClient {
    int                                                                          _version;
    const(void)*                                                                 clientInfo;

    // Version 0
    WKPageGetContextMenuFromProposedContextMenuCallback_deprecatedForUseWithV0   getContextMenuFromProposedMenu_deprecatedForUseWithV0;
    WKPageCustomContextMenuItemSelectedCallback                                  customContextMenuItemSelected;

    // Version 1
    WKPageContextMenuDismissedCallback                                           contextMenuDismissed;

    // Version 2
    WKPageGetContextMenuFromProposedContextMenuCallback                          getContextMenuFromProposedMenu;
}

enum kWKPageContextMenuClientCurrentVersion = 2;

WKTypeID WKPageGetTypeID();

WKContextRef WKPageGetContext(WKPageRef page);
WKPageGroupRef WKPageGetPageGroup(WKPageRef page);

void WKPageLoadURL(WKPageRef page, WKURLRef url);
void WKPageLoadURLRequest(WKPageRef page, WKURLRequestRef urlRequest);
void WKPageLoadHTMLString(WKPageRef page, WKStringRef htmlString, WKURLRef baseURL);
void WKPageLoadAlternateHTMLString(WKPageRef page, WKStringRef htmlString, WKURLRef baseURL, WKURLRef unreachableURL);
void WKPageLoadPlainTextString(WKPageRef page, WKStringRef plainTextString);
void WKPageLoadWebArchiveData(WKPageRef page, WKDataRef webArchiveData);

void WKPageStopLoading(WKPageRef page);
void WKPageReload(WKPageRef page);
void WKPageReloadFromOrigin(WKPageRef page);

bool WKPageTryClose(WKPageRef page);
void WKPageClose(WKPageRef page);
bool WKPageIsClosed(WKPageRef page);

void WKPageGoForward(WKPageRef page);
bool WKPageCanGoForward(WKPageRef page);
void WKPageGoBack(WKPageRef page);
bool WKPageCanGoBack(WKPageRef page);
void WKPageGoToBackForwardListItem(WKPageRef page, WKBackForwardListItemRef item);
void WKPageTryRestoreScrollPosition(WKPageRef page);
WKBackForwardListRef WKPageGetBackForwardList(WKPageRef page);
bool WKPageWillHandleHorizontalScrollEvents(WKPageRef page);
    
WKStringRef WKPageCopyTitle(WKPageRef page);

WKURLRef WKPageCopyPendingAPIRequestURL(WKPageRef page);

WKURLRef WKPageCopyActiveURL(WKPageRef page);
WKURLRef WKPageCopyProvisionalURL(WKPageRef page);
WKURLRef WKPageCopyCommittedURL(WKPageRef page);

WKFrameRef WKPageGetMainFrame(WKPageRef page);
WKFrameRef WKPageGetFocusedFrame(WKPageRef page); // The focused frame may be inactive.
WKFrameRef WKPageGetFrameSetLargestFrame(WKPageRef page);
double WKPageGetEstimatedProgress(WKPageRef page);

ulong WKPageGetRenderTreeSize(WKPageRef page);

void WKPageSetMemoryCacheClientCallsEnabled(WKPageRef page, bool memoryCacheClientCallsEnabled);

version(ENABLE_INSPECTOR)
{
	WKInspectorRef WKPageGetInspector(WKPageRef page);
}

WKStringRef WKPageCopyUserAgent(WKPageRef page);

WKStringRef WKPageCopyApplicationNameForUserAgent(WKPageRef page);
void WKPageSetApplicationNameForUserAgent(WKPageRef page, WKStringRef applicationName);

WKStringRef WKPageCopyCustomUserAgent(WKPageRef page);
void WKPageSetCustomUserAgent(WKPageRef page, WKStringRef userAgent);

bool WKPageSupportsTextEncoding(WKPageRef page);
WKStringRef WKPageCopyCustomTextEncodingName(WKPageRef page);
void WKPageSetCustomTextEncodingName(WKPageRef page, WKStringRef encodingName);

void WKPageTerminate(WKPageRef page);

WKStringRef WKPageGetSessionHistoryURLValueType();

alias extern(C) bool function(WKPageRef page, WKStringRef valueType, WKTypeRef value, void* context) WKPageSessionStateFilterCallback;
WKDataRef WKPageCopySessionState(WKPageRef page, void* context, WKPageSessionStateFilterCallback urlAllowedCallback);
void WKPageRestoreFromSessionState(WKPageRef page, WKDataRef sessionStateData);

double WKPageGetBackingScaleFactor(WKPageRef page);
void WKPageSetCustomBackingScaleFactor(WKPageRef page, double customScaleFactor);

bool WKPageSupportsTextZoom(WKPageRef page);
double WKPageGetTextZoomFactor(WKPageRef page);
void WKPageSetTextZoomFactor(WKPageRef page, double zoomFactor);
double WKPageGetPageZoomFactor(WKPageRef page);
void WKPageSetPageZoomFactor(WKPageRef page, double zoomFactor);
void WKPageSetPageAndTextZoomFactors(WKPageRef page, double pageZoomFactor, double textZoomFactor);

void WKPageSetScaleFactor(WKPageRef page, double scale, WKPoint origin);
double WKPageGetScaleFactor(WKPageRef page);

void WKPageSetUseFixedLayout(WKPageRef page, bool fixed);
void WKPageSetFixedLayoutSize(WKPageRef page, WKSize size);
bool WKPageUseFixedLayout(WKPageRef page);
WKSize WKPageFixedLayoutSize(WKPageRef page);

void WKPageListenForLayoutMilestones(WKPageRef page, WKLayoutMilestones milestones);

bool WKPageHasHorizontalScrollbar(WKPageRef page);
bool WKPageHasVerticalScrollbar(WKPageRef page);

void WKPageSetSuppressScrollbarAnimations(WKPageRef page, bool suppressAnimations);
bool WKPageAreScrollbarAnimationsSuppressed(WKPageRef page);

bool WKPageIsPinnedToLeftSide(WKPageRef page);
bool WKPageIsPinnedToRightSide(WKPageRef page);

bool WKPageCanDelete(WKPageRef page);
bool WKPageHasSelectedRange(WKPageRef page);
bool WKPageIsContentEditable(WKPageRef page);

void WKPageSetMaintainsInactiveSelection(WKPageRef page, bool maintainsInactiveSelection);
void WKPageCenterSelectionInVisibleArea(WKPageRef page);

void WKPageFindString(WKPageRef page, WKStringRef string, WKFindOptions findOptions, uint maxMatchCount);
void WKPageHideFindUI(WKPageRef page);
void WKPageCountStringMatches(WKPageRef page, WKStringRef string, WKFindOptions findOptions, uint maxMatchCount);

void WKPageSetPageContextMenuClient(WKPageRef page, const WKPageContextMenuClient* client);
void WKPageSetPageFindClient(WKPageRef page, const WKPageFindClient* client);
void WKPageSetPageFormClient(WKPageRef page, const WKPageFormClient* client);
void WKPageSetPageLoaderClient(WKPageRef page, const WKPageLoaderClient* client);
void WKPageSetPagePolicyClient(WKPageRef page, const WKPagePolicyClient* client);
void WKPageSetPageResourceLoadClient(WKPageRef page, const WKPageResourceLoadClient* client);
void WKPageSetPageUIClient(WKPageRef page, const WKPageUIClient* client);

alias extern(C) void function(WKSerializedScriptValueRef, WKErrorRef, void*) WKPageRunJavaScriptFunction;
void WKPageRunJavaScriptInMainFrame(WKPageRef page, WKStringRef script, void* context, WKPageRunJavaScriptFunction func);

version(__BLOCKS__)
{
	alias extern(C) void function(WKSerializedScriptValueRef, WKErrorRef) WKPageRunJavaScriptBlock;
	void WKPageRunJavaScriptInMainFrame_b(WKPageRef page, WKStringRef script, WKPageRunJavaScriptBlock block);
}

alias extern(C) void function(WKStringRef, WKErrorRef, void*) WKPageGetSourceForFrameFunction;
void WKPageGetSourceForFrame(WKPageRef page, WKFrameRef frame, void* context, WKPageGetSourceForFrameFunction func);
version(__BLOCKS__)
{
	alias extern(C) void function(WKStringRef, WKErrorRef) WKPageGetSourceForFrameBlock;
	void WKPageGetSourceForFrame_b(WKPageRef page, WKFrameRef frame, WKPageGetSourceForFrameBlock block);
}

alias extern(C) void function(WKStringRef, WKErrorRef, void*) WKPageGetContentsAsStringFunction;
void WKPageGetContentsAsString(WKPageRef page, void* context, WKPageGetContentsAsStringFunction func);
version(__BLOCKS__)
{
	alias extern(C) void function(WKStringRef, WKErrorRef) WKPageGetContentsAsStringBlock;
	void WKPageGetContentsAsString_b(WKPageRef page, WKPageGetContentsAsStringBlock block);
}

alias extern(C) void function(WKDataRef, WKErrorRef, void*) WKPageGetContentsAsMHTMLDataFunction;
void WKPageGetContentsAsMHTMLData(WKPageRef page, bool useBinaryEncoding, void* context, WKPageGetContentsAsMHTMLDataFunction func);

alias extern(C) void function(WKErrorRef, void*) WKPageForceRepaintFunction;
void WKPageForceRepaint(WKPageRef page, void* context, WKPageForceRepaintFunction func);

void WKPageDeliverIntentToFrame(WKPageRef page, WKFrameRef frame, WKIntentDataRef intent);


alias extern(C) void function(WKStringRef command, bool isEnabled, int state, WKErrorRef, void* context) WKPageValidateCommandCallback;
void WKPageValidateCommand(WKPageRef page, WKStringRef command, void* context, WKPageValidateCommandCallback callback);
void WKPageExecuteCommand(WKPageRef page, WKStringRef command);

void WKPagePostMessageToInjectedBundle(WKPageRef page, WKStringRef messageName, WKTypeRef messageBody);

