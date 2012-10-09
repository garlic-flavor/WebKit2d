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

/*	CFArray.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
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

CFTypeID CFArrayGetTypeID();

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const(void)** values, CFIndex numValues, const(CFArrayCallBacks)* callBacks);
CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray);
CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const(CFArrayCallBacks)* callBacks);
CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray);
CFIndex CFArrayGetCount(CFArrayRef theArray);
CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const(void)* value);
Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const(void)* value);
const(void)* CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx);
void CFArrayGetValues(CFArrayRef theArray, CFRange range, const(void)** values);
void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void* context);
CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const(void)* value);
CFIndex CFArrayGetLastIndexOfValue(CFArrayRef theArray, CFRange range, const(void)* value);
CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const(void)* value, CFComparatorFunction comparator, void* context);
void CFArrayAppendValue(CFMutableArrayRef theArray, const(void)* value);
void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const(void)* value);
void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const(void)* value);
void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx);
void CFArrayRemoveAllValues(CFMutableArrayRef theArray);
void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const(void)** newValues, CFIndex newCount);
void CFArrayExchangeValuesAtIndices(CFMutableArrayRef theArray, CFIndex idx1, CFIndex idx2);
void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void* context);
void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange);

