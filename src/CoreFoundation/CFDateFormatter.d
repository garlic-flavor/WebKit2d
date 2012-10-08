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
/*	CFDateFormatter.h
	Copyright (c) 2003-2007, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFDateFormatter;

import CoreFoundation.CFBase;
import CoreFoundation.CFDate;
import CoreFoundation.CFLocale;

extern(C):

alias void __CFDateFormatter;
alias __CFDateFormatter* CFDateFormatterRef;

extern(C) CFTypeID CFDateFormatterGetTypeID();

enum {	// date and time format styles
	kCFDateFormatterNoStyle = 0,
	kCFDateFormatterShortStyle = 1,
	kCFDateFormatterMediumStyle = 2,
	kCFDateFormatterLongStyle = 3,
	kCFDateFormatterFullStyle = 4
}
alias CFIndex CFDateFormatterStyle;

extern(C) CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle);

extern(C) CFLocaleRef CFDateFormatterGetLocale(CFDateFormatterRef formatter);

extern(C) CFDateFormatterStyle CFDateFormatterGetDateStyle(CFDateFormatterRef formatter);

extern(C) CFDateFormatterStyle CFDateFormatterGetTimeStyle(CFDateFormatterRef formatter);

extern(C) CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter);

extern(C) void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString);

extern(C) CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date);

extern(C) CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at);

extern(C) CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange* rangep);

extern(C) Boolean CFDateFormatterGetAbsoluteTimeFromString(CFDateFormatterRef formatter, CFStringRef string, CFRange* rangep, CFAbsoluteTime* atp);

extern(C) void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value);

extern(C) CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFStringRef key);

extern(C) extern const CFStringRef kCFDateFormatterIsLenient;	// CFBoolean
extern(C) extern const CFStringRef kCFDateFormatterTimeZone;		// CFTimeZone
extern(C) extern const CFStringRef kCFDateFormatterCalendarName;	// CFString
extern(C) extern const CFStringRef kCFDateFormatterDefaultFormat;	// CFString
extern(C) extern const CFStringRef kCFDateFormatterTwoDigitStartDate; // CFDate
extern(C) extern const CFStringRef kCFDateFormatterDefaultDate;	// CFDate
extern(C) extern const CFStringRef kCFDateFormatterCalendar;		// CFCalendar
extern(C) extern const CFStringRef kCFDateFormatterEraSymbols;	// CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterMonthSymbols;	// CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterShortMonthSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterWeekdaySymbols;	// CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterShortWeekdaySymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterAMSymbol;		// CFString
extern(C) extern const CFStringRef kCFDateFormatterPMSymbol;		// CFString
extern(C) extern const CFStringRef kCFDateFormatterLongEraSymbols;   // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterVeryShortMonthSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterStandaloneMonthSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterShortStandaloneMonthSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterVeryShortStandaloneMonthSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterVeryShortWeekdaySymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterStandaloneWeekdaySymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterShortStandaloneWeekdaySymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterVeryShortStandaloneWeekdaySymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterQuarterSymbols; 	// CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterShortQuarterSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterStandaloneQuarterSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterShortStandaloneQuarterSymbols; // CFArray of CFString
extern(C) extern const CFStringRef kCFDateFormatterGregorianStartDate; // CFDate

// See CFLocale.h for these calendar constants:
//	const CFStringRef kCFGregorianCalendar;
//	const CFStringRef kCFBuddhistCalendar;
//	const CFStringRef kCFJapaneseCalendar;
//	const CFStringRef kCFIslamicCalendar;
//	const CFStringRef kCFIslamicCivilCalendar;
//	const CFStringRef kCFHebrewCalendar;
//	const CFStringRef kCFChineseCalendar;

