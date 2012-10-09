/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKContext;

import WebKit2.WKBase;

extern(C):

enum
{
    kWKCacheModelDocumentViewer = 0,
    kWKCacheModelDocumentBrowser = 1,
    kWKCacheModelPrimaryWebBrowser = 2
}

alias uint WKCacheModel;

alias extern(C) void function( WKContextRef, WKStringRef, WKTypeRef, const(void)* ) WKContextDidReceiveMessageFromInjectedBundleCallback;
alias extern(C) void function( WKContextRef, WKStringRef, WKTypeRef, WKTypeRef*, const(void)* ) WKContextDidReceiveSynchronousMessageFromInjectedBundleCallback;
alias extern(C) WKTypeRef function( WKContextRef, const(void)* ) WKContextGetInjectedBundleInitializationUserDataCallback;

struct WKContextInjectedBundleClient {
    int                                                                 _version;
    const(void)*                                                        clientInfo;

    // Version 0.
    WKContextDidReceiveMessageFromInjectedBundleCallback                didReceiveMessageFromInjectedBundle;
    WKContextDidReceiveSynchronousMessageFromInjectedBundleCallback     didReceiveSynchronousMessageFromInjectedBundle;

    // Version 1.
    WKContextGetInjectedBundleInitializationUserDataCallback            getInjectedBundleInitializationUserData;
}

enum kWKContextInjectedBundleClientCurrentVersion = 1;

alias extern(C) void function( WKContextRef, WKPageRef, WKNavigationDataRef, WKFrameRef, const(void)* ) WKContextDidNavigateWithNavigationDataCallback;
alias extern(C) void function( WKContextRef, WKPageRef, WKURLRef, WKURLRef, WKFrameRef, const(void)* ) WKContextDidPerformClientRedirectCallback;
alias extern(C) void function( WKContextRef, WKPageRef, WKURLRef, WKURLRef, WKFrameRef, const(void)* ) WKContextDidPerformServerRedirectCallback;
alias extern(C) void function( WKContextRef, WKPageRef, WKStringRef, WKURLRef, WKFrameRef, const(void)* ) WKContextDidUpdateHistoryTitleCallback;
alias extern(C) void function( WKContextRef, const(void)* ) WKContextPopulateVisitedLinksCallback;

struct WKContextHistoryClient {
    int                                                                 _version;
    const(void)*                                                        clientInfo;
    WKContextDidNavigateWithNavigationDataCallback                      didNavigateWithNavigationData;
    WKContextDidPerformClientRedirectCallback                           didPerformClientRedirect;
    WKContextDidPerformServerRedirectCallback                           didPerformServerRedirect;
    WKContextDidUpdateHistoryTitleCallback                              didUpdateHistoryTitle;
    WKContextPopulateVisitedLinksCallback                               populateVisitedLinks;
}

enum kWKContextHistoryClientCurrentVersion = 0;

alias extern(C) void function(WKContextRef context, WKDownloadRef download, const(void)* clientInfo) WKContextDownloadDidStartCallback;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, WKAuthenticationChallengeRef authenticationChallenge, const(void)* clientInfo) WKContextDownloadDidReceiveAuthenticationChallengeCallback;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, WKURLResponseRef response, const(void)* clientInfo) WKContextDownloadDidReceiveResponseCallback;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, ulong length, const(void)* clientInfo) WKContextDownloadDidReceiveDataCallback;
alias extern(C) bool function(WKContextRef context, WKDownloadRef download, WKStringRef mimeType, const(void)* clientInfo) WKContextDownloadShouldDecodeSourceDataOfMIMETypeCallback;
alias extern(C) WKStringRef function(WKContextRef context, WKDownloadRef download, WKStringRef filename, bool* allowOverwrite, const(void)* clientInfo) WKContextDownloadDecideDestinationWithSuggestedFilenameCallback;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, WKStringRef path, const(void)* clientInfo) WKContextDownloadDidCreateDestinationCallback;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, const(void)* clientInfo) WKContextDownloadDidFinishCallback;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, WKErrorRef error, const(void)* clientInfo) WKContextDownloadDidFailCallback;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, const(void)* clientInfo) WKContextDownloadDidCancel;
alias extern(C) void function(WKContextRef context, WKDownloadRef download, const(void)* clientInfo) WKContextDownloadProcessDidCrashCallback;

struct WKContextDownloadClient
{
    int                                                                 _version;
    const(void)*                                                        clientInfo;
    WKContextDownloadDidStartCallback                                   didStart;
    WKContextDownloadDidReceiveAuthenticationChallengeCallback          didReceiveAuthenticationChallenge;
    WKContextDownloadDidReceiveResponseCallback                         didReceiveResponse;
    WKContextDownloadDidReceiveDataCallback                             didReceiveData;
    WKContextDownloadShouldDecodeSourceDataOfMIMETypeCallback           shouldDecodeSourceDataOfMIMEType;
    WKContextDownloadDecideDestinationWithSuggestedFilenameCallback     decideDestinationWithSuggestedFilename;
    WKContextDownloadDidCreateDestinationCallback                       didCreateDestination;
    WKContextDownloadDidFinishCallback                                  didFinish;
    WKContextDownloadDidFailCallback                                    didFail;
    WKContextDownloadDidCancel                                          didCancel;
    WKContextDownloadProcessDidCrashCallback                            processDidCrash;
}

enum kWKContextDownloadClientCurrentVersion = 0;

alias extern(C) void function (WKContextRef context, WKConnectionRef connection, const(void)* clientInfo) WKContextDidCreateConnection;

struct WKContextConnectionClient
{
    int                                                                 _version;
    const(void)*                                                        clientInfo;
    WKContextDidCreateConnection                                        didCreateConnection;
}

enum kWKContextConnectionClientCurrentVersion = 0;

enum
{
    kWKProcessModelSharedSecondaryProcess = 0,
    kWKProcessModelMultipleSecondaryProcesses = 1
}
alias uint WKProcessModel;

WKTypeID WKContextGetTypeID();

WKContextRef WKContextCreate();
WKContextRef WKContextCreateWithInjectedBundlePath(WKStringRef path);

void WKContextSetInjectedBundleClient(WKContextRef context, const(WKContextInjectedBundleClient)* client);
void WKContextSetHistoryClient(WKContextRef context, const(WKContextHistoryClient)* client);
void WKContextSetDownloadClient(WKContextRef context, const(WKContextDownloadClient)* client);
void WKContextSetConnectionClient(WKContextRef context, const(WKContextConnectionClient)* client);

WKDownloadRef WKContextDownloadURLRequest(WKContextRef context, const WKURLRequestRef request);

void WKContextSetInitializationUserDataForInjectedBundle(WKContextRef context, WKTypeRef userData);
void WKContextPostMessageToInjectedBundle(WKContextRef context, WKStringRef messageName, WKTypeRef messageBody);

void WKContextAddVisitedLink(WKContextRef context, WKStringRef visitedURL);

void WKContextSetCacheModel(WKContextRef context, WKCacheModel cacheModel);
WKCacheModel WKContextGetCacheModel(WKContextRef context);

void WKContextSetProcessModel(WKContextRef context, WKProcessModel processModel);
WKProcessModel WKContextGetProcessModel(WKContextRef context);

void WKContextStartMemorySampler(WKContextRef context, WKDoubleRef interval);
void WKContextStopMemorySampler(WKContextRef context);

WKApplicationCacheManagerRef WKContextGetApplicationCacheManager(WKContextRef context);
WKBatteryManagerRef WKContextGetBatteryManager(WKContextRef context);
WKCookieManagerRef WKContextGetCookieManager(WKContextRef context);
WKDatabaseManagerRef WKContextGetDatabaseManager(WKContextRef context);
WKGeolocationManagerRef WKContextGetGeolocationManager(WKContextRef context);
WKIconDatabaseRef WKContextGetIconDatabase(WKContextRef context);
WKKeyValueStorageManagerRef WKContextGetKeyValueStorageManager(WKContextRef context);
WKMediaCacheManagerRef WKContextGetMediaCacheManager(WKContextRef context);
WKNetworkInfoManagerRef WKContextGetNetworkInfoManager(WKContextRef context);
WKNotificationManagerRef WKContextGetNotificationManager(WKContextRef context);
WKPluginSiteDataManagerRef WKContextGetPluginSiteDataManager(WKContextRef context);
WKResourceCacheManagerRef WKContextGetResourceCacheManager(WKContextRef context);
WKVibrationRef WKContextGetVibration(WKContextRef context);

alias extern(C) void function(WKDictionaryRef statistics, WKErrorRef error, void* functionContext) WKContextGetStatisticsFunction;
void WKContextGetStatistics(WKContextRef context, void* functionContext, WKContextGetStatisticsFunction);

void WKContextGarbageCollectJavaScriptObjects(WKContextRef context);
void WKContextSetJavaScriptGarbageCollectorTimerEnabled(WKContextRef context, bool enable);
