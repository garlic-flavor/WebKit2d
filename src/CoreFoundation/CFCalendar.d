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

/*	CFCalendar.h
	Copyright (c) 2004-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFCalendar;

import CoreFoundation.CFBase;
import CoreFoundation.CFLocale;
import CoreFoundation.CFDate;
import CoreFoundation.CFTimeZone;

extern(C):

alias void __CFCalendar;
alias __CFCalendar* CFCalendarRef;

extern(C) CFTypeID CFCalendarGetTypeID();

extern(C) CFCalendarRef CFCalendarCopyCurrent();

extern(C) CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFStringRef identifier);

extern(C) CFStringRef CFCalendarGetIdentifier(CFCalendarRef calendar);

extern(C) CFLocaleRef CFCalendarCopyLocale(CFCalendarRef calendar);

extern(C) void CFCalendarSetLocale(CFCalendarRef calendar, CFLocaleRef locale);

extern(C) CFTimeZoneRef CFCalendarCopyTimeZone(CFCalendarRef calendar);

extern(C) void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz);

extern(C) CFIndex CFCalendarGetFirstWeekday(CFCalendarRef calendar);

extern(C) void CFCalendarSetFirstWeekday(CFCalendarRef calendar, CFIndex wkdy);

extern(C) CFIndex CFCalendarGetMinimumDaysInFirstWeek(CFCalendarRef calendar);

extern(C) void CFCalendarSetMinimumDaysInFirstWeek(CFCalendarRef calendar, CFIndex mwd);


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
}
alias CFOptionFlags CFCalendarUnit;

extern(C) CFRange CFCalendarGetMinimumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit);

extern(C) CFRange CFCalendarGetMaximumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit);

extern(C) CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at);

extern(C) CFIndex CFCalendarGetOrdinalityOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at);

extern(C) Boolean CFCalendarGetTimeRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit, CFAbsoluteTime at, CFAbsoluteTime* startp, CFTimeInterval* tip);

extern(C) Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, /* out */ CFAbsoluteTime* at, const(char)* componentDesc, ...);

extern(C) Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const(char)* componentDesc, ...);


enum {
    kCFCalendarComponentsWrap = (1u << 0)  // option for adding
};

extern(C) Boolean CFCalendarAddComponents(CFCalendarRef calendar, /* inout */ CFAbsoluteTime* at, CFOptionFlags options, const(char)* componentDesc, ...);

extern(C) Boolean CFCalendarGetComponentDifference(CFCalendarRef calendar, CFAbsoluteTime startingAT, CFAbsoluteTime resultAT, CFOptionFlags options, const(char)* componentDesc, ...);
