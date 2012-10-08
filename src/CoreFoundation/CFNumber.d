/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2003 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * Copyright (c) 1999-2003 Apple Computer, Inc.  All Rights Reserved.
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
/*	CFNumber.h
	Copyright (c) 1999-2003, Apple, Inc. All rights reserved.
*/

module CoreFoundation.CFNumber;

import CoreFoundation.CFBase;

extern(C):

alias void __CFBoolean;
alias const(__CFBoolean)* CFBooleanRef;

extern(C) extern const CFBooleanRef kCFBooleanTrue;
extern(C) extern const CFBooleanRef kCFBooleanFalse;

extern(C) CFTypeID CFBooleanGetTypeID();

extern(C) Boolean CFBooleanGetValue(CFBooleanRef boolean);

enum CFNumberType
{
    /* Types from MacTypes.h */
    kCFNumberSInt8Type = 1,
    kCFNumberSInt16Type = 2,
    kCFNumberSInt32Type = 3,
    kCFNumberSInt64Type = 4,
    kCFNumberFloat32Type = 5,
    kCFNumberFloat64Type = 6,	/* 64-bit IEEE 754 */
    /* Basic C types */
    kCFNumberCharType = 7,
    kCFNumberShortType = 8,
    kCFNumberIntType = 9,
    kCFNumberLongType = 10,
    kCFNumberLongLongType = 11,
    kCFNumberFloatType = 12,
    kCFNumberDoubleType = 13,
    /* Other */
    kCFNumberCFIndexType = 14,
    kCFNumberMaxType = 14
}
alias void __CFNumber;
alias const(__CFNumber)* CFNumberRef;

extern(C) extern const CFNumberRef kCFNumberPositiveInfinity;
extern(C) extern const CFNumberRef kCFNumberNegativeInfinity;
extern(C) extern const CFNumberRef kCFNumberNaN;

extern(C) CFTypeID CFNumberGetTypeID();

extern(C) CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const(void)* valuePtr);

extern(C) CFNumberType CFNumberGetType(CFNumberRef number);

extern(C) CFIndex CFNumberGetByteSize(CFNumberRef number);

extern(C) Boolean CFNumberIsFloatType(CFNumberRef number);

extern(C) Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void* valuePtr);

extern(C) CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void* context);

