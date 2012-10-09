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

/*	CFCalendar.h
	Copyright (c) 2004-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFCalendar;

import CoreFoundation.CFBase;
import CoreFoundation.CFLocale;
import CoreFoundation.CFDate;
import CoreFoundation.CFTimeZone;

extern(C):

alias void __CFCalendar;
alias __CFCalendar* CFCalendarRef;

CFTypeID CFCalendarGetTypeID();

CFCalendarRef CFCalendarCopyCurrent();

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFStringRef identifier);

CFStringRef CFCalendarGetIdentifier(CFCalendarRef calendar);

CFLocaleRef CFCalendarCopyLocale(CFCalendarRef calendar);

void CFCalendarSetLocale(CFCalendarRef calendar, CFLocaleRef locale);

CFTimeZoneRef CFCalendarCopyTimeZone(CFCalendarRef calendar);

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz);

CFIndex CFCalendarGetFirstWeekday(CFCalendarRef calendar);

void CFCalendarSetFirstWeekday(CFCalendarRef calendar, CFIndex wkdy);

CFIndex CFCalendarGetMinimumDaysInFirstWeek(CFCalendarRef calendar);

void CFCalendarSetMinimumDaysInFirstWeek(CFCalendarRef calendar, CFIndex mwd);


enum {
	kCFCalendarUnitEra = (1u << 1),
	kCFCalendarUnitYear = (1u << 2),
	kCFCalendarUnitMonth = (1u << 3),
	kCFCalendarUnitDay = (1u << 4),
	kCFCalendarUnitHour = (1u << 5),
	kCFCalendarUnitMinute = (1u << 6),
	kCFCalendarUnitSecond = (1u << 7),
	kCFCalendarUnitWeek = (1u << 8),
	kCFCalendarUnitWeekday = (1u << 9),
	kCFCalendarUnitWeekdayOrdinal = (1u << 10),
	kCFCalendarUnitQuarter = (1u << 11),
	kCFCalendarUnitWeekOfMonth = (1UL << 12),
	kCFCalendarUnitWeekOfYear = (1UL << 13),
	kCFCalendarUnitYearForWeekOfYear = (1UL << 14),
}
alias CFOptionFlags CFCalendarUnit;

CFRange CFCalendarGetMinimumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit);

CFRange CFCalendarGetMaximumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit);

CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at);

CFIndex CFCalendarGetOrdinalityOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at);

Boolean CFCalendarGetTimeRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit, CFAbsoluteTime at, CFAbsoluteTime* startp, CFTimeInterval* tip);

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, /* out */ CFAbsoluteTime* at, const(char)* componentDesc, ...);

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const(char)* componentDesc, ...);


enum {
    kCFCalendarComponentsWrap = (1u << 0)  // option for adding
};

Boolean CFCalendarAddComponents(CFCalendarRef calendar, /* inout */ CFAbsoluteTime* at, CFOptionFlags options, const(char)* componentDesc, ...);

Boolean CFCalendarGetComponentDifference(CFCalendarRef calendar, CFAbsoluteTime startingAT, CFAbsoluteTime resultAT, CFOptionFlags options, const(char)* componentDesc, ...);
