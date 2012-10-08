/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKString;

import WebKit2.WKBase;

extern(C):

version(Windows) alias wchar WKChar;
else alias ushort WKChar;

WKTypeID WKStringGetTypeID();

WKStringRef WKStringCreateWithUTF8CString(const char* string);

bool WKStringIsEmpty(WKStringRef string);

size_t WKStringGetLength(WKStringRef string);
size_t WKStringGetCharacters(WKStringRef string, WKChar* buffer, size_t bufferLength);

size_t WKStringGetMaximumUTF8CStringSize(WKStringRef string);
size_t WKStringGetUTF8CString(WKStringRef string, char* buffer, size_t bufferSize);

bool WKStringIsEqual(WKStringRef a, WKStringRef b);
bool WKStringIsEqualToUTF8CString(WKStringRef a, const char* b);
bool WKStringIsEqualToUTF8CStringIgnoringCase(WKStringRef a, const char* b);

