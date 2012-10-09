/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKContextPrivate;

import WebKit2.WKBase;
import WebKit2.WKContext;

struct WKContextStatistics {
    uint wkViewCount;
    uint wkPageCount;
    uint wkFrameCount;
}

alias extern(C) void WKContextGetGlobalStatistics(WKContextStatistics* statistics);

alias extern(C) void WKContextSetAdditionalPluginsDirectory(WKContextRef context, WKStringRef pluginsDirectory);

alias extern(C) void WKContextRegisterURLSchemeAsEmptyDocument(WKContextRef context, WKStringRef urlScheme);

alias extern(C) void WKContextSetAlwaysUsesComplexTextCodePath(WKContextRef context, bool alwaysUseComplexTextCodePath);

alias extern(C) void WKContextSetShouldUseFontSmoothing(WKContextRef context, bool useFontSmoothing);

alias extern(C) void WKContextRegisterURLSchemeAsSecure(WKContextRef context, WKStringRef urlScheme);

alias extern(C) void WKContextSetDomainRelaxationForbiddenForURLScheme(WKContextRef context, WKStringRef urlScheme);

alias extern(C) void WKContextSetIconDatabasePath(WKContextRef context, WKStringRef iconDatabasePath);

// FIXME: These functions are only effective if called before the Web process is launched. But
// we should really change these settings to be on WebPreferences and changeable at runtime.
alias extern(C) void WKContextSetDatabaseDirectory(WKContextRef context, WKStringRef databaseDirectory);
alias extern(C) void WKContextSetLocalStorageDirectory(WKContextRef context, WKStringRef localStorageDirectory);

// FIXME: This is a workaround for testing purposes only and should be removed once a better
// solution has been found for testing.
alias extern(C) void WKContextDisableProcessTermination(WKContextRef context);
alias extern(C) void WKContextEnableProcessTermination(WKContextRef context);

alias extern(C) void WKContextSetHTTPPipeliningEnabled(WKContextRef context, bool enabled);

alias extern(C) void WKContextWarmInitialProcess(WKContextRef context);
