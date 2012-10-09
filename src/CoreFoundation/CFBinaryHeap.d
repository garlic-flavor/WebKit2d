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

/*	CFBinaryHeap.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/
module CoreFoundation.CFBinaryHeap;

import CoreFoundation.CFBase;

extern(C):

struct CFBinaryHeapCompareContext
{
    CFIndex	_version;
    void*	info;
    extern(C) const(void)* function(const(void)* info) retain;
    extern(C) void function(const(void)*info) release;
    extern(C) CFStringRef function(const void *info) copyDescription;
}
struct CFBinaryHeapCallBacks
{
    CFIndex _version;
    extern(C) const(void)* function(CFAllocatorRef allocator, const(void)* ptr) retain;
    extern(C) void function(CFAllocatorRef allocator, const(void)* ptr) release;
    extern(C) CFStringRef function(const(void)*ptr) copyDescription;
    extern(C) CFComparisonResult function(const(void)* ptr1, const(void)* ptr2, void* context) compare;
}

extern(C) extern const CFBinaryHeapCallBacks kCFStringBinaryHeapCallBacks;

alias extern(C) void function(const(void)* val, void* context) CFBinaryHeapApplierFunction;

alias void __CFBinaryHeap;
alias __CFBinaryHeap* CFBinaryHeapRef;

CFTypeID FBinaryHeapGetTypeID();

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const(CFBinaryHeapCallBacks)* callBacks, const(CFBinaryHeapCompareContext)* compareContext);

CFBinaryHeapRef CFBinaryHeapCreateCopy(CFAllocatorRef allocator, CFIndex capacity, CFBinaryHeapRef heap);

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap);

CFIndex CFBinaryHeapGetCountOfValue(CFBinaryHeapRef heap, const(void)* value);

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const(void)* value);

const(void)* FBinaryHeapGetMinimum(CFBinaryHeapRef heap);

Boolean CFBinaryHeapGetMinimumIfPresent(CFBinaryHeapRef heap, const(void)** value);

void CFBinaryHeapGetValues(CFBinaryHeapRef heap, const(void)** values);

void CFBinaryHeapApplyFunction(CFBinaryHeapRef heap, CFBinaryHeapApplierFunction applier, void* context);

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const(void)* value);

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap);

void CFBinaryHeapRemoveAllValues(CFBinaryHeapRef heap);
