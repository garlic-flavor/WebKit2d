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
/*	CFArray.h
	Copyright (c) 1998-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFArray;

import CoreFoundation.CFBase;

extern(C):

alias extern(C) const(void)* function(CFAllocatorRef allocator, const(void)* value) CFArrayRetainCallBack;
alias extern(C) void function(CFAllocatorRef allocator, const(void)* value) CFArrayReleaseCallBack;
alias extern(C) CFStringRef function(const(void)* value) CFArrayCopyDescriptionCallBack;
alias extern(C) Boolean function(const(void)* value1, const(void)* value2) CFArrayEqualCallBack;

struct CFArrayCallBacks
{
    CFIndex    _version;
    CFArrayRetainCallBack  retain;
    CFArrayReleaseCallBack  release;
    CFArrayCopyDescriptionCallBack copyDescription;
    CFArrayEqualCallBack  equal;
}

extern(C) extern const CFArrayCallBacks kCFTypeArrayCallBacks;

alias extern(C) void function(const(void)* value, void* context) CFArrayApplierFunction;

alias void __CFArray;
alias const(__CFArray)* CFArrayRef;
alias __CFArray* CFMutableArrayRef;

extern(C) CFTypeID CFArrayGetTypeID();

extern(C) CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const(void)** values, CFIndex numValues, const(CFArrayCallBacks)* callBacks);
extern(C) CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray);
extern(C) CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const(CFArrayCallBacks)* callBacks);
extern(C) CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray);
extern(C) CFIndex CFArrayGetCount(CFArrayRef theArray);
extern(C) CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const(void)* value);
extern(C) Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const(void)* value);
extern(C) const(void)* CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx);
extern(C) void CFArrayGetValues(CFArrayRef theArray, CFRange range, const(void)** values);
extern(C) void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void* context);
extern(C) CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const(void)* value);
extern(C) CFIndex CFArrayGetLastIndexOfValue(CFArrayRef theArray, CFRange range, const(void)* value);
extern(C) CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const(void)* value, CFComparatorFunction comparator, void* context);
extern(C) void CFArrayAppendValue(CFMutableArrayRef theArray, const(void)* value);
extern(C) void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const(void)* value);
extern(C) void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const(void)* value);
extern(C) void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx);
extern(C) void CFArrayRemoveAllValues(CFMutableArrayRef theArray);
extern(C) void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const(void)** newValues, CFIndex newCount);
extern(C) void CFArrayExchangeValuesAtIndices(CFMutableArrayRef theArray, CFIndex idx1, CFIndex idx2);
extern(C) void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void* context);
extern(C) void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange);

