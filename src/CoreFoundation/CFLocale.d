/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2012 Apple Inc. All rights reserved.
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

/*	CFLocale.h
	Copyright (c) 2002-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFLocale;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFDictionary;

extern(C):

alias void __CFLocale;
alias const(__CFLocale)* CFLocaleRef;

CFTypeID CFLocaleGetTypeID();

CFLocaleRef CFLocaleGetSystem();

CFLocaleRef CFLocaleCopyCurrent();

CFArrayRef CFLocaleCopyAvailableLocaleIdentifiers();

CFArrayRef CFLocaleCopyISOLanguageCodes();

CFArrayRef CFLocaleCopyISOCountryCodes();

CFArrayRef CFLocaleCopyISOCurrencyCodes();

CFArrayRef CFLocaleCopyCommonISOCurrencyCodes();

CFArrayRef CFLocaleCopyPreferredLanguages();

CFStringRef CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier);

CFStringRef CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier) ;

CFStringRef CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(CFAllocatorRef allocator, LangCode lcode, RegionCode rcode);

CFStringRef CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode(CFAllocatorRef allocator, uint lcid);

uint CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(CFStringRef localeIdentifier);

enum {
    kCFLocaleLanguageDirectionUnknown = 0,
    kCFLocaleLanguageDirectionLeftToRight = 1,
    kCFLocaleLanguageDirectionRightToLeft = 2,
    kCFLocaleLanguageDirectionTopToBottom = 3,
    kCFLocaleLanguageDirectionBottomToTop = 4
};
alias CFIndex CFLocaleLanguageDirection;

CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode);

CFLocaleLanguageDirection CFLocaleGetLanguageLineDirection(CFStringRef isoLangCode);

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFStringRef localeID);

CFStringRef CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary);

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFStringRef localeIdentifier);

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale);

CFStringRef CFLocaleGetIdentifier(CFLocaleRef locale);

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFStringRef key);

CFStringRef CFLocaleCopyDisplayNameForPropertyValue(CFLocaleRef displayLocale, CFStringRef key, CFStringRef value);

extern(C) extern const CFStringRef kCFLocaleCurrentLocaleDidChangeNotification;


extern(C) extern const CFStringRef kCFLocaleIdentifier;
extern(C) extern const CFStringRef kCFLocaleLanguageCode;
extern(C) extern const CFStringRef kCFLocaleCountryCode;
extern(C) extern const CFStringRef kCFLocaleScriptCode;
extern(C) extern const CFStringRef kCFLocaleVariantCode;

extern(C) extern const CFStringRef kCFLocaleExemplarCharacterSet;
extern(C) extern const CFStringRef kCFLocaleCalendarIdentifier;
extern(C) extern const CFStringRef kCFLocaleCalendar;
extern(C) extern const CFStringRef kCFLocaleCollationIdentifier;
extern(C) extern const CFStringRef kCFLocaleUsesMetricSystem;
extern(C) extern const CFStringRef kCFLocaleMeasurementSystem;
extern(C) extern const CFStringRef kCFLocaleDecimalSeparator;
extern(C) extern const CFStringRef kCFLocaleGroupingSeparator;
extern(C) extern const CFStringRef kCFLocaleCurrencySymbol;
extern(C) extern const CFStringRef kCFLocaleCurrencyCode;
extern(C) extern const CFStringRef kCFLocaleCollatorIdentifier;
extern(C) extern const CFStringRef kCFLocaleQuotationBeginDelimiterKey;
extern(C) extern const CFStringRef kCFLocaleQuotationEndDelimiterKey;
extern(C) extern const CFStringRef kCFLocaleAlternateQuotationBeginDelimiterKey;
extern(C) extern const CFStringRef kCFLocaleAlternateQuotationEndDelimiterKey;

extern(C) extern const CFStringRef kCFGregorianCalendar;
extern(C) extern const CFStringRef kCFBuddhistCalendar;
extern(C) extern const CFStringRef kCFChineseCalendar;
extern(C) extern const CFStringRef kCFHebrewCalendar;
extern(C) extern const CFStringRef kCFIslamicCalendar;
extern(C) extern const CFStringRef kCFIslamicCivilCalendar;
extern(C) extern const CFStringRef kCFJapaneseCalendar;
extern(C) extern const CFStringRef kCFRepublicOfChinaCalendar;
extern(C) extern const CFStringRef kCFPersianCalendar;
extern(C) extern const CFStringRef kCFIndianCalendar;
extern(C) extern const CFStringRef kCFISO8601Calendar;

