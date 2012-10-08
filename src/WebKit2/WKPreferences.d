/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKPreferences;

import WebKit2.WKBase;

extern(C):

enum WKStorageBlockingPolicy {
    kWKAllowAllStorage = 0,
    kWKBlockThirdPartyStorage,
    kWKBlockAllStorage
}

WKTypeID WKPreferencesGetTypeID();

WKPreferencesRef WKPreferencesCreate();
WKPreferencesRef WKPreferencesCreateWithIdentifier(WKStringRef identifier);

// Defaults to true.
void WKPreferencesSetJavaScriptEnabled(WKPreferencesRef preferences, bool javaScriptEnabled);
bool WKPreferencesGetJavaScriptEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetLoadsImagesAutomatically(WKPreferencesRef preferences, bool loadsImagesAutomatically);
bool WKPreferencesGetLoadsImagesAutomatically(WKPreferencesRef preferences);

// Defaults to false.
void WKPreferencesSetLoadsSiteIconsIgnoringImageLoadingPreference(WKPreferencesRef preferences, bool loadsSiteIconsIgnoringImageLoadingPreference);
bool WKPreferencesGetLoadsSiteIconsIgnoringImageLoadingPreference(WKPreferencesRef preferences);

// Defaults to false.
void WKPreferencesSetOfflineWebApplicationCacheEnabled(WKPreferencesRef preferences, bool offlineWebApplicationCacheEnabled);
bool WKPreferencesGetOfflineWebApplicationCacheEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetLocalStorageEnabled(WKPreferencesRef preferences, bool localStorageEnabled);
bool WKPreferencesGetLocalStorageEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetDatabasesEnabled(WKPreferencesRef preferences, bool databasesEnabled);
bool WKPreferencesGetDatabasesEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetXSSAuditorEnabled(WKPreferencesRef preferences, bool xssAuditorEnabled);
bool WKPreferencesGetXSSAuditorEnabled(WKPreferencesRef preferences);

// Defaults to false.
void WKPreferencesSetFrameFlatteningEnabled(WKPreferencesRef preferences, bool frameFlatteningEnabled);
bool WKPreferencesGetFrameFlatteningEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetPluginsEnabled(WKPreferencesRef preferences, bool pluginsEnabled);
bool WKPreferencesGetPluginsEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetJavaEnabled(WKPreferencesRef preferences, bool javaEnabled);
bool WKPreferencesGetJavaEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetJavaScriptCanOpenWindowsAutomatically(WKPreferencesRef preferences, bool javaScriptCanOpenWindowsAutomatically);
bool WKPreferencesGetJavaScriptCanOpenWindowsAutomatically(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetHyperlinkAuditingEnabled(WKPreferencesRef preferences, bool hyperlinkAuditingEnabled);
bool WKPreferencesGetHyperlinkAuditingEnabled(WKPreferencesRef preferences);

void WKPreferencesSetStandardFontFamily(WKPreferencesRef preferencesRef, WKStringRef family);
WKStringRef WKPreferencesCopyStandardFontFamily(WKPreferencesRef preferencesRef);

void WKPreferencesSetFixedFontFamily(WKPreferencesRef preferencesRef, WKStringRef family);
WKStringRef WKPreferencesCopyFixedFontFamily(WKPreferencesRef preferencesRef);

void WKPreferencesSetSerifFontFamily(WKPreferencesRef preferencesRef, WKStringRef family);
WKStringRef WKPreferencesCopySerifFontFamily(WKPreferencesRef preferencesRef);

void WKPreferencesSetSansSerifFontFamily(WKPreferencesRef preferencesRef, WKStringRef family);
WKStringRef WKPreferencesCopySansSerifFontFamily(WKPreferencesRef preferencesRef);

void WKPreferencesSetCursiveFontFamily(WKPreferencesRef preferencesRef, WKStringRef family);
WKStringRef WKPreferencesCopyCursiveFontFamily(WKPreferencesRef preferencesRef);

void WKPreferencesSetFantasyFontFamily(WKPreferencesRef preferencesRef, WKStringRef family);
WKStringRef WKPreferencesCopyFantasyFontFamily(WKPreferencesRef preferencesRef);

void WKPreferencesSetPictographFontFamily(WKPreferencesRef preferencesRef, WKStringRef family);
WKStringRef WKPreferencesCopyPictographFontFamily(WKPreferencesRef preferencesRef);

// Defaults to 16.
void WKPreferencesSetDefaultFontSize(WKPreferencesRef preferencesRef, uint);
uint WKPreferencesGetDefaultFontSize(WKPreferencesRef preferencesRef);

// Defaults to 13.
void WKPreferencesSetDefaultFixedFontSize(WKPreferencesRef preferencesRef, uint);
uint WKPreferencesGetDefaultFixedFontSize(WKPreferencesRef preferencesRef);

// Defaults to 0.
void WKPreferencesSetMinimumFontSize(WKPreferencesRef preferencesRef, uint);
uint WKPreferencesGetMinimumFontSize(WKPreferencesRef preferencesRef);

void WKPreferencesSetDefaultTextEncodingName(WKPreferencesRef preferencesRef, WKStringRef name);
WKStringRef WKPreferencesCopyDefaultTextEncodingName(WKPreferencesRef preferencesRef);

// Defaults to false.
void WKPreferencesSetPrivateBrowsingEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetPrivateBrowsingEnabled(WKPreferencesRef preferencesRef);

// Defaults to false.
void WKPreferencesSetDeveloperExtrasEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetDeveloperExtrasEnabled(WKPreferencesRef preferencesRef);

// Defaults to false.
void WKPreferencesSetJavaScriptExperimentsEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetJavaScriptExperimentsEnabled(WKPreferencesRef preferencesRef);

// Defaults to true.
void WKPreferencesSetTextAreasAreResizable(WKPreferencesRef preferencesRef, bool resizable);
bool WKPreferencesGetTextAreasAreResizable(WKPreferencesRef preferencesRef);

// Defaults to false.
void WKPreferencesSetTabsToLinks(WKPreferencesRef preferences, bool tabsToLinks);
bool WKPreferencesGetTabsToLinks(WKPreferencesRef preferences);

// Defaults to false.
void WKPreferencesSetDNSPrefetchingEnabled(WKPreferencesRef preferences, bool enabled);
bool WKPreferencesGetDNSPrefetchingEnabled(WKPreferencesRef preferences);

// Defaults to true.
void WKPreferencesSetAuthorAndUserStylesEnabled(WKPreferencesRef preferences, bool enabled);
bool WKPreferencesGetAuthorAndUserStylesEnabled(WKPreferencesRef preferences);

// Defaults to false.
void WKPreferencesSetShouldPrintBackgrounds(WKPreferencesRef preferences, bool shouldPrintBackgrounds);
bool WKPreferencesGetShouldPrintBackgrounds(WKPreferencesRef preferences);

// Defaults to false.
void WKPreferencesSetJavaScriptCanAccessClipboard(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetJavaScriptCanAccessClipboard(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetFullScreenEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetFullScreenEnabled(WKPreferencesRef preferencesRef);

// Defaults to true.
void WKPreferencesSetAVFoundationEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetAVFoundationEnabled(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetWebAudioEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetWebAudioEnabled(WKPreferencesRef preferencesRef);
    
// Defaults to false
void WKPreferencesSetSuppressesIncrementalRendering(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetSuppressesIncrementalRendering(WKPreferencesRef preferencesRef);

// Defaults to true
void WKPreferencesSetBackspaceKeyNavigationEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetBackspaceKeyNavigationEnabled(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetCaretBrowsingEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetCaretBrowsingEnabled(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetShouldDisplaySubtitles(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetShouldDisplaySubtitles(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetShouldDisplayCaptions(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetShouldDisplayCaptions(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetShouldDisplayTextDescriptions(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetShouldDisplayTextDescriptions(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetNotificationsEnabled(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetNotificationsEnabled(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetShouldRespectImageOrientation(WKPreferencesRef preferencesRef, bool enabled);
bool WKPreferencesGetShouldRespectImageOrientation(WKPreferencesRef preferencesRef);

// Defaults to false
void WKPreferencesSetStorageBlockingPolicy(WKPreferencesRef preferencesRef, WKStorageBlockingPolicy policy);
WKStorageBlockingPolicy WKPreferencesGetStorageBlockingPolicy(WKPreferencesRef preferencesRef);

