/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2010 Apple Inc. All rights reserved.
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

/*	CFNumberFormatter.h
	Copyright (c) 2003-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFNumberFormatter;

import CoreFoundation.CFBase;
import CoreFoundation.CFNumber;
import CoreFoundation.CFLocale;

extern(C):

alias void __CFNumberFormatter;
alias __CFNumberFormatter* CFNumberFormatterRef;

extern(C) CFTypeID CFNumberFormatterGetTypeID();

enum {	// number format styles
	kCFNumberFormatterNoStyle = 0,
	kCFNumberFormatterDecimalStyle = 1,
	kCFNumberFormatterCurrencyStyle = 2,
	kCFNumberFormatterPercentStyle = 3,
	kCFNumberFormatterScientificStyle = 4,
	kCFNumberFormatterSpellOutStyle = 5
}
alias CFIndex CFNumberFormatterStyle;


extern(C) CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style);

extern(C) CFLocaleRef CFNumberFormatterGetLocale(CFNumberFormatterRef formatter);

extern(C) CFNumberFormatterStyle CFNumberFormatterGetStyle(CFNumberFormatterRef formatter);

extern(C) CFStringRef CFNumberFormatterGetFormat(CFNumberFormatterRef formatter);

extern(C) void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString);

extern(C) CFStringRef CFNumberFormatterCreateStringWithNumber(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberRef number);

extern(C) CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr);

enum {
    kCFNumberFormatterParseIntegersOnly = 1	/* only parse integers */
};
alias CFOptionFlags CFNumberFormatterOptionFlags;

extern(C) CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange* rangep, CFOptionFlags options);

extern(C) Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange* rangep, CFNumberType numberType, void* valuePtr);

extern(C) void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFStringRef key, CFTypeRef value);

extern(C) CFTypeRef CFNumberFormatterCopyProperty(CFNumberFormatterRef formatter, CFStringRef key);

extern(C) extern const CFStringRef kCFNumberFormatterCurrencyCode;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterDecimalSeparator;	// CFString
extern(C) extern const CFStringRef kCFNumberFormatterCurrencyDecimalSeparator; // CFString
extern(C) extern const CFStringRef kCFNumberFormatterAlwaysShowDecimalSeparator; // CFBoolean
extern(C) extern const CFStringRef kCFNumberFormatterGroupingSeparator;	// CFString
extern(C) extern const CFStringRef kCFNumberFormatterUseGroupingSeparator;	// CFBoolean
extern(C) extern const CFStringRef kCFNumberFormatterPercentSymbol;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterZeroSymbol;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterNaNSymbol;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterInfinitySymbol;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterMinusSign;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterPlusSign;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterCurrencySymbol;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterExponentSymbol;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterMinIntegerDigits;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterMaxIntegerDigits;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterMinFractionDigits;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterMaxFractionDigits;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterGroupingSize;		// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterSecondaryGroupingSize;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterRoundingMode;		// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterRoundingIncrement;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterFormatWidth;		// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterPaddingPosition;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterPaddingCharacter;	// CFString
extern(C) extern const CFStringRef kCFNumberFormatterDefaultFormat;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterMultiplier;		// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterPositivePrefix;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterPositiveSuffix;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterNegativePrefix;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterNegativeSuffix;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterPerMillSymbol;		// CFString
extern(C) extern const CFStringRef kCFNumberFormatterInternationalCurrencySymbol; // CFString
extern(C) extern const CFStringRef kCFNumberFormatterCurrencyGroupingSeparator; // CFString
extern(C) extern const CFStringRef kCFNumberFormatterIsLenient;		// CFBoolean
extern(C) extern const CFStringRef kCFNumberFormatterUseSignificantDigits;	// CFBoolean
extern(C) extern const CFStringRef kCFNumberFormatterMinSignificantDigits;	// CFNumber
extern(C) extern const CFStringRef kCFNumberFormatterMaxSignificantDigits;	// CFNumber

enum{
    kCFNumberFormatterRoundCeiling = 0,
    kCFNumberFormatterRoundFloor = 1,
    kCFNumberFormatterRoundDown = 2,
    kCFNumberFormatterRoundUp = 3,
    kCFNumberFormatterRoundHalfEven = 4,
    kCFNumberFormatterRoundHalfDown = 5,
    kCFNumberFormatterRoundHalfUp = 6
}
alias CFIndex CFNumberFormatterRoundingMode;

enum {
    kCFNumberFormatterPadBeforePrefix = 0,
    kCFNumberFormatterPadAfterPrefix = 1,
    kCFNumberFormatterPadBeforeSuffix = 2,
    kCFNumberFormatterPadAfterSuffix = 3
}
alias CFIndex CFNumberFormatterPadPosition;


extern(C) Boolean CFNumberFormatterGetDecimalInfoForCurrencyCode(CFStringRef currencyCode, int* defaultFractionDigits, double* roundingIncrement);
