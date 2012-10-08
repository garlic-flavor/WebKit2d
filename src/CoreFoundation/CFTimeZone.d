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
/*	CFTimeZone.h
	Copyright (c) 1998-2007, Apple Inc. All rights reserved.
*/
module CoreFoundation.CFTimeZone;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFData;
import CoreFoundation.CFDate;
import CoreFoundation.CFDictionary;
import CoreFoundation.CFString;

extern(C):

extern(C) CFTypeID CFTimeZoneGetTypeID();

extern(C) CFTimeZoneRef CFTimeZoneCopySystem();

extern(C) void CFTimeZoneResetSystem();

extern(C) CFTimeZoneRef CFTimeZoneCopyDefault();

extern(C) void CFTimeZoneSetDefault(CFTimeZoneRef tz);

extern(C) CFArrayRef CFTimeZoneCopyKnownNames();

extern(C) CFDictionaryRef CFTimeZoneCopyAbbreviationDictionary();

extern(C) void CFTimeZoneSetAbbreviationDictionary(CFDictionaryRef dict);

extern(C) CFTimeZoneRef CFTimeZoneCreate(CFAllocatorRef allocator, CFStringRef name, CFDataRef data);

extern(C) CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti);

extern(C) CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev);

extern(C) CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz);

extern(C) CFDataRef CFTimeZoneGetData(CFTimeZoneRef tz);

extern(C) CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at);

extern(C) CFStringRef CFTimeZoneCopyAbbreviation(CFTimeZoneRef tz, CFAbsoluteTime at);

extern(C) Boolean CFTimeZoneIsDaylightSavingTime(CFTimeZoneRef tz, CFAbsoluteTime at);

extern(C) CFTimeInterval CFTimeZoneGetDaylightSavingTimeOffset(CFTimeZoneRef tz, CFAbsoluteTime at);

extern(C) CFAbsoluteTime CFTimeZoneGetNextDaylightSavingTimeTransition(CFTimeZoneRef tz, CFAbsoluteTime at);

enum {
	kCFTimeZoneNameStyleStandard,
	kCFTimeZoneNameStyleShortStandard,
	kCFTimeZoneNameStyleDaylightSaving,
	kCFTimeZoneNameStyleShortDaylightSaving
};
alias CFIndex CFTimeZoneNameStyle;

/*
extern(C) CFStringRef CFTimeZoneCopyLocalizedName(CFTimeZoneRef tz, CFTimeZoneNameStyle style, CFLocaleRef locale);
*/

extern(C) extern const CFStringRef kCFTimeZoneSystemTimeZoneDidChangeNotification;

