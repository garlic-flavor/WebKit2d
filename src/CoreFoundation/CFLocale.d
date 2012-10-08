/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2009 Apple Inc. All rights reserved.
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
	Copyright (c) 2002-2009, Apple Inc. All rights reserved.
*/
module CoreFoundation.CFLocale;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFDictionary;

extern(C):

alias void __CFLocale;
alias const(__CFLocale)* CFLocaleRef;

extern(C) CFTypeID CFLocaleGetTypeID();

extern(C) CFLocaleRef CFLocaleGetSystem();

extern(C) CFLocaleRef CFLocaleCopyCurrent();

extern(C) CFArrayRef CFLocaleCopyAvailableLocaleIdentifiers();

extern(C) CFArrayRef CFLocaleCopyISOLanguageCodes();

extern(C) CFArrayRef CFLocaleCopyISOCountryCodes();

extern(C) CFArrayRef CFLocaleCopyISOCurrencyCodes();

extern(C) CFArrayRef CFLocaleCopyCommonISOCurrencyCodes();

extern(C) CFArrayRef CFLocaleCopyPreferredLanguages();

extern(C) CFStringRef CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier);

extern(C) CFStringRef CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier) ;

extern(C) CFStringRef CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(CFAllocatorRef allocator, LangCode lcode, RegionCode rcode);

extern(C) CFStringRef CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode(CFAllocatorRef allocator, uint lcid);

extern(C) uint CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(CFStringRef localeIdentifier);

enum {
    kCFLocaleLanguageDirectionUnknown = 0,
    kCFLocaleLanguageDirectionLeftToRight = 1,
    kCFLocaleLanguageDirectionRightToLeft = 2,
    kCFLocaleLanguageDirectionTopToBottom = 3,
    kCFLocaleLanguageDirectionBottomToTop = 4
};
alias CFIndex CFLocaleLanguageDirection;

extern(C) CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode);

extern(C) CFLocaleLanguageDirection CFLocaleGetLanguageLineDirection(CFStringRef isoLangCode);

extern(C) CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFStringRef localeID);

extern(C) CFStringRef CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary);

extern(C) CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFStringRef localeIdentifier);

extern(C) CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale);

extern(C) CFStringRef CFLocaleGetIdentifier(CFLocaleRef locale);

extern(C) CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFStringRef key);

extern(C) CFStringRef CFLocaleCopyDisplayNameForPropertyValue(CFLocaleRef displayLocale, CFStringRef key, CFStringRef value);

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

