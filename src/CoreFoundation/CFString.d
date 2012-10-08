/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2008 Apple Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */
/*	CFString.h
	Copyright (c) 1998-2007, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFString;

import core.stdc.stdarg;
import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFData;
import CoreFoundation.CFDictionary;
import CoreFoundation.CFCharacterSet;
import CoreFoundation.CFLocale;

extern(C):

alias UInt32 CFStringEncoding;

enum kCFStringEncodingInvalidId = 0xffffffffU;

enum {
    kCFStringEncodingMacRoman = 0,
    kCFStringEncodingWindowsLatin1 = 0x0500, /* ANSI codepage 1252 */
    kCFStringEncodingISOLatin1 = 0x0201, /* ISO 8859-1 */
    kCFStringEncodingNextStepLatin = 0x0B01, /* NextStep encoding*/
    kCFStringEncodingASCII = 0x0600, /* 0..127 (in creating CFString, values greater than 0x7F are treated as corresponding Unicode value) */
    kCFStringEncodingUnicode = 0x0100, /* kTextEncodingUnicodeDefault  + kTextEncodingDefaultFormat (aka kUnicode16BitFormat) */
    kCFStringEncodingUTF8 = 0x08000100, /* kTextEncodingUnicodeDefault + kUnicodeUTF8Format */
    kCFStringEncodingNonLossyASCII = 0x0BFF /* 7bit Unicode variants used by Cocoa & Java */
    ,
    kCFStringEncodingUTF16 = 0x0100, /* kTextEncodingUnicodeDefault + kUnicodeUTF16Format (alias of kCFStringEncodingUnicode) */
    kCFStringEncodingUTF16BE = 0x10000100, /* kTextEncodingUnicodeDefault + kUnicodeUTF16BEFormat */
    kCFStringEncodingUTF16LE = 0x14000100, /* kTextEncodingUnicodeDefault + kUnicodeUTF16LEFormat */

    kCFStringEncodingUTF32 = 0x0c000100, /* kTextEncodingUnicodeDefault + kUnicodeUTF32Format */
    kCFStringEncodingUTF32BE = 0x18000100, /* kTextEncodingUnicodeDefault + kUnicodeUTF32BEFormat */
    kCFStringEncodingUTF32LE = 0x1c000100 /* kTextEncodingUnicodeDefault + kUnicodeUTF32LEFormat */
};
alias CFStringEncoding CFStringBuiltInEncodings;

extern(C) CFTypeID CFStringGetTypeID();

/+ ??
#ifdef __CONSTANT_CFSTRINGS__
#define CFSTR(cStr)  ((CFStringRef) __builtin___CFStringMakeConstantString ("" cStr ""))
#else
#define CFSTR(cStr)  __CFStringMakeConstantString("" cStr "")
#endif
+/

extern(C) CFStringRef CFStringCreateWithPascalString(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding);

extern(C) CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const(char)* cStr, CFStringEncoding encoding);

extern(C) CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const(UInt8)* bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation);

extern(C) CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const(UniChar)* chars, CFIndex numChars);


extern(C) CFStringRef CFStringCreateWithPascalStringNoCopy(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator);

extern(C) CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const(char)* cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator);

extern(C) CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const(UInt8)* bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator);


extern(C) CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const(UniChar)* chars, CFIndex numChars, CFAllocatorRef contentsDeallocator);

extern(C) CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range);

extern(C) CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString);

extern(C) CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...);

extern(C) CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments);

extern(C) CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength);

extern(C) CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString);

extern(C) CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator);

extern(C) CFIndex CFStringGetLength(CFStringRef theString);

extern(C) UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx);

extern(C) void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar* buffer);


extern(C) Boolean CFStringGetPascalString(CFStringRef theString, StringPtr buffer, CFIndex bufferSize, CFStringEncoding encoding);

extern(C) Boolean CFStringGetCString(CFStringRef theString, char* buffer, CFIndex bufferSize, CFStringEncoding encoding);

extern(C) ConstStringPtr CFStringGetPascalStringPtr(CFStringRef theString, CFStringEncoding encoding);	/* May return NULL at any time; be prepared for NULL */

extern(C) const(char)* CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding);		/* May return NULL at any time; be prepared for NULL */

extern(C) const(UniChar)* CFStringGetCharactersPtr(CFStringRef theString);					/* May return NULL at any time; be prepared for NULL */

extern(C) CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8* buffer, CFIndex maxBufLen, CFIndex* usedBufLen);

extern(C) CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding);	/* May return NULL on conversion error */

extern(C) CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte);	/* May return NULL on conversion error */	

extern(C) CFStringEncoding CFStringGetSmallestEncoding(CFStringRef theString);	/* Result in O(n) time max */

extern(C) CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString);	/* Result in O(1) time max */

extern(C) CFStringEncoding CFStringGetSystemEncoding();		/* The default encoding for the system; untagged 8-bit characters are usually in this encoding */

extern(C) CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding);	/* Max bytes a string of specified length (in UniChars) will take up if encoded */


extern(C) Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char* buffer, CFIndex maxBufLen);

extern(C) CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string);

extern(C) CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const(char)* buffer);


enum {	
    kCFCompareCaseInsensitive = 1,	
    kCFCompareBackwards = 4,		/* Starting from the end of the string */
    kCFCompareAnchored = 8,		/* Only at the specified starting point */
    kCFCompareNonliteral = 16,		/* If specified, loose equivalence is performed (o-umlaut == o, umlaut) */
    kCFCompareLocalized = 32,		/* User's default locale is used for the comparisons */
    kCFCompareNumerically = 64		/* Numeric comparison is used; that is, Foo2.txt < Foo7.txt < Foo25.txt */
    ,
    kCFCompareDiacriticInsensitive = 128, /* If specified, ignores diacritics (o-umlaut == o) */
    kCFCompareWidthInsensitive = 256, /* If specified, ignores width differences ('a' == UFF41) */
    kCFCompareForcedOrdering = 512 /* If specified, comparisons are forced to return either kCFCompareLessThan or kCFCompareGreaterThan if the strings are equivalent but not strictly equal, for stability when sorting (e.g. "aaa" > "AAA" with kCFCompareCaseInsensitive specified) */
 /* MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5 */
};
alias CFOptionFlags CFStringCompareFlags;

/+
#if !defined (__WIN32__)
#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5
CF_EXPORT
CFComparisonResult CFStringCompareWithOptionsAndLocale(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFOptionFlags compareOptions, CFLocaleRef locale) AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;
#endif /* MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5 */
#endif //__WIN32__
+/

extern(C) CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFOptionFlags compareOptions);

extern(C) CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFOptionFlags compareOptions);

/+
#if !defined (__WIN32__)
#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5
CF_EXPORT
Boolean CFStringFindWithOptionsAndLocale(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFOptionFlags searchOptions, CFLocaleRef locale, CFRange *result) AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;
#endif /* MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5 */
#endif //__WIN32__
+/

extern(C) Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFOptionFlags searchOptions, CFRange* result);

extern(C) CFArrayRef CFStringCreateArrayWithFindResults(CFAllocatorRef alloc, CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFOptionFlags compareOptions);

extern(C) CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFOptionFlags compareOptions);

extern(C) Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix);

extern(C) Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix);

extern(C) CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex);

extern(C) Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFOptionFlags searchOptions, CFRange* result);

extern(C) void CFStringGetLineBounds(CFStringRef theString, CFRange range, CFIndex* lineBeginIndex, CFIndex* lineEndIndex, CFIndex* contentsEndIndex); 

extern(C) void CFStringGetParagraphBounds(CFStringRef string, CFRange range, CFIndex* parBeginIndex, CFIndex* parEndIndex, CFIndex* contentsEndIndex);

extern(C) CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString);	/* Empty array returns empty string; one element array returns the element */

extern(C) CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString);	/* No separators in the string returns array with that string; string == sep returns two empty strings */


extern(C) SInt32 CFStringGetIntValue(CFStringRef str);		/* Skips whitespace; returns 0 on error, MAX or -MAX on overflow */

extern(C) double CFStringGetDoubleValue(CFStringRef str);	/* Skips whitespace; returns 0.0 on error */


extern(C) void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString);

extern(C) void CFStringAppendCharacters(CFMutableStringRef theString, const(UniChar)* chars, CFIndex numChars);

extern(C) void CFStringAppendPascalString(CFMutableStringRef theString, ConstStr255Param pStr, CFStringEncoding encoding);

extern(C) void CFStringAppendCString(CFMutableStringRef theString, const(char)* cStr, CFStringEncoding encoding);

extern(C) void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...);

extern(C) void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments);

extern(C) void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr);

extern(C) void CFStringDelete(CFMutableStringRef theString, CFRange range);

extern(C) void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement);

extern(C) void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement);	/* Replaces whole string */

extern(C) CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFOptionFlags compareOptions);

extern(C) void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar* chars, CFIndex length, CFIndex capacity);	/* Works only on specially created mutable strings! */

extern(C) void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad);

extern(C) void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString);

extern(C) void CFStringTrimWhitespace(CFMutableStringRef theString);

extern(C) void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale);

extern(C) void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale);

extern(C) void CFStringCapitalize(CFMutableStringRef theString, CFLocaleRef locale);

extern(C) void CFStringLowercase(CFMutableStringRef theString, const(void)* localeTBD); // localeTBD must be NULL on pre-10.3

extern(C) void CFStringUppercase(CFMutableStringRef theString, const(void)* localeTBD); // localeTBD must be NULL on pre-10.3

extern(C) void CFStringCapitalize(CFMutableStringRef theString, const(void)* localeTBD); // localeTBD must be NULL on pre-10.3

enum {
	kCFStringNormalizationFormD = 0, // Canonical Decomposition
	kCFStringNormalizationFormKD, // Compatibility Decomposition
	kCFStringNormalizationFormC, // Canonical Decomposition followed by Canonical Composition
	kCFStringNormalizationFormKC // Compatibility Decomposition followed by Canonical Composition
};
alias CFIndex CFStringNormalizationForm;

extern(C) void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm);


extern(C) void CFStringFold(CFMutableStringRef theString, CFOptionFlags theFlags, CFLocaleRef theLocale);

extern(C) Boolean CFStringTransform(CFMutableStringRef string, CFRange* range, CFStringRef transform, Boolean reverse);

extern(C) extern const CFStringRef kCFStringTransformStripCombiningMarks;
extern(C) extern const CFStringRef kCFStringTransformToLatin;
extern(C) extern const CFStringRef kCFStringTransformFullwidthHalfwidth;
extern(C) extern const CFStringRef kCFStringTransformLatinKatakana;
extern(C) extern const CFStringRef kCFStringTransformLatinHiragana;
extern(C) extern const CFStringRef kCFStringTransformHiraganaKatakana;
extern(C) extern const CFStringRef kCFStringTransformMandarinLatin;
extern(C) extern const CFStringRef kCFStringTransformLatinHangul;
extern(C) extern const CFStringRef kCFStringTransformLatinArabic;
extern(C) extern const CFStringRef kCFStringTransformLatinHebrew;
extern(C) extern const CFStringRef kCFStringTransformLatinThai;
extern(C) extern const CFStringRef kCFStringTransformLatinCyrillic;
extern(C) extern const CFStringRef kCFStringTransformLatinGreek;
extern(C) extern const CFStringRef kCFStringTransformToXMLHex;
extern(C) extern const CFStringRef kCFStringTransformToUnicodeName;
extern(C) extern const CFStringRef kCFStringTransformStripDiacritics;


extern(C) Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding);

extern(C) const(CFStringEncoding)* CFStringGetListOfAvailableEncodings();

extern(C) CFStringRef CFStringGetNameOfEncoding(CFStringEncoding encoding);

extern(C) uint CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding);

extern(C) CFStringEncoding CFStringConvertNSStringEncodingToEncoding(uint encoding);

extern(C) UInt32 CFStringConvertEncodingToWindowsCodepage(CFStringEncoding encoding);

extern(C) CFStringEncoding CFStringConvertWindowsCodepageToEncoding(UInt32 codepage);

extern(C) CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString);

extern(C) CFStringRef  CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding);

extern(C) CFStringEncoding CFStringGetMostCompatibleMacStringEncoding(CFStringEncoding encoding);


enum __kCFStringInlineBufferLength = 64;
struct  CFStringInlineBuffer
{
    UniChar[__kCFStringInlineBufferLength] buffer;
    CFStringRef theString;
    const(UniChar)* directBuffer;
    CFRange rangeToBuffer;		/* Range in string to buffer */
    CFIndex bufferedRangeStart;		/* Start of range currently buffered (relative to rangeToBuffer.location) */
    CFIndex bufferedRangeEnd;		/* bufferedRangeStart + number of chars actually buffered */
}

void CFStringInitInlineBuffer(CFStringRef str, CFStringInlineBuffer* buf, CFRange range) {
    buf.theString = str;
    buf.rangeToBuffer = range;
    buf.directBuffer = CFStringGetCharactersPtr(str);
    buf.bufferedRangeStart = buf.bufferedRangeEnd = 0;
}

UniChar CFStringGetCharacterFromInlineBuffer(CFStringInlineBuffer* buf, CFIndex idx) {
    if (buf.directBuffer) {
	if (idx < 0 || idx >= buf.rangeToBuffer.length) return 0;
        return buf.directBuffer[idx + buf.rangeToBuffer.location];
    }
    if (idx >= buf.bufferedRangeEnd || idx < buf.bufferedRangeStart) {
	if (idx < 0 || idx >= buf.rangeToBuffer.length) return 0;
	if ((buf.bufferedRangeStart = idx - 4) < 0) buf.bufferedRangeStart = 0;
	buf.bufferedRangeEnd = buf.bufferedRangeStart + __kCFStringInlineBufferLength;
	if (buf.bufferedRangeEnd > buf.rangeToBuffer.length) buf.bufferedRangeEnd = buf.rangeToBuffer.length;
	CFStringGetCharacters(buf.theString, CFRangeMake(buf.rangeToBuffer.location + buf.bufferedRangeStart, buf.bufferedRangeEnd - buf.bufferedRangeStart), buf.buffer.ptr);
    }
    return buf.buffer[idx - buf.bufferedRangeStart];
}



extern(C) void CFShow(CFTypeRef obj);

extern(C) void CFShowStr(CFStringRef str);

extern(C) CFStringRef  __CFStringMakeConstantString(const(char)* cStr);	/* Private; do not use */

