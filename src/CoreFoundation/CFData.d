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
/*	CFData.h
	Copyright (c) 1998-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFData;

import CoreFoundation.CFBase;

extern(C):

alias void __CFData;
alias const(__CFData)* CFDataRef;
alias  __CFData* CFMutableDataRef;

extern(C) CFTypeID CFDataGetTypeID();

extern(C) CFDataRef CFDataCreate(CFAllocatorRef allocator, const(UInt8)* bytes, CFIndex length);

extern(C) CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const(UInt8)* bytes, CFIndex length, CFAllocatorRef bytesDeallocator);

extern(C) CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData);

extern(C) CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity);

extern(C) CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData);

extern(C) CFIndex CFDataGetLength(CFDataRef theData);

extern(C) const(UInt8)* CFDataGetBytePtr(CFDataRef theData);

extern(C) UInt8* CFDataGetMutableBytePtr(CFMutableDataRef theData);

extern(C) void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8* buffer);

extern(C) void CFDataSetLength(CFMutableDataRef theData, CFIndex length);

extern(C) void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength);

extern(C) void CFDataAppendBytes(CFMutableDataRef theData, const(UInt8)* bytes, CFIndex length);

extern(C) void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const(UInt8)* newBytes, CFIndex newLength);

extern(C) void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range);

enum {
    kCFDataSearchBackwards = 1u << 0,
    kCFDataSearchAnchored = 1u << 1
};

alias CFOptionFlags CFDataSearchFlags;

extern(C) CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions);
