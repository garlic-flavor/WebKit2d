/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2005 Apple Computer, Inc. All rights reserved.
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
/*	CFDate.h
	Copyright (c) 1998-2005, Apple, Inc. All rights reserved.
*/

module CoreFoundation.CFDate;

import CoreFoundation.CFBase;

extern(C):

alias double CFTimeInterval;
alias CFTimeInterval CFAbsoluteTime;

extern(C) CFAbsoluteTime CFAbsoluteTimeGetCurrent();

extern(C) extern const CFTimeInterval kCFAbsoluteTimeIntervalSince1970;
extern(C) extern const CFTimeInterval kCFAbsoluteTimeIntervalSince1904;

alias void __CFDate;
alias const( __CFDate)* CFDateRef;

extern(C) CFTypeID CFDateGetTypeID();

extern(C) CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at);

extern(C) CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate);

extern(C) CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate);

extern(C) CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void* context);

alias void __CFTimeZone;
alias const(__CFTimeZone)* CFTimeZoneRef;

struct CFGregorianDate
{
    SInt32 year;
    SInt8 month;
    SInt8 day;
    SInt8 hour;
    SInt8 minute;
    double second;
}

struct CFGregorianUnits
{
    SInt32 years;
    SInt32 months;
    SInt32 days;
    SInt32 hours;
    SInt32 minutes;
    double seconds;
}

enum  CFGregorianUnitFlags
{
    kCFGregorianUnitsYears = (1 << 0),
    kCFGregorianUnitsMonths = (1 << 1),
    kCFGregorianUnitsDays = (1 << 2),
    kCFGregorianUnitsHours = (1 << 3),
    kCFGregorianUnitsMinutes = (1 << 4),
    kCFGregorianUnitsSeconds = (1 << 5),

/*
{
    kCFGregorianUnitsTimeZone = (1 << 8),
    kCFGregorianUnitsDayOfWeek = (1 << 9),
}
*/
    kCFGregorianAllUnits = 0x00FFFFFF
}

extern(C) Boolean CFGregorianDateIsValid(CFGregorianDate gdate, CFOptionFlags unitFlags);

extern(C) CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz);

extern(C) CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz);

extern(C) CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits units);

extern(C) CFGregorianUnits CFAbsoluteTimeGetDifferenceAsGregorianUnits(CFAbsoluteTime at1, CFAbsoluteTime at2, CFTimeZoneRef tz, CFOptionFlags unitFlags);

extern(C) SInt32 CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime at, CFTimeZoneRef tz);

extern(C) SInt32 CFAbsoluteTimeGetDayOfYear(CFAbsoluteTime at, CFTimeZoneRef tz);

extern(C) SInt32 CFAbsoluteTimeGetWeekOfYear(CFAbsoluteTime at, CFTimeZoneRef tz);
