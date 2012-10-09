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

/*	CFSet.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/
/*!
        @header CFSet
        CFSet implements a container which stores unique values.
*/
module CoreFoundation.CFSet;

import CoreFoundation.CFBase;

extern(C):

alias extern(C) const(void)* function(CFAllocatorRef allocator, const(void)* value) CFSetRetainCallBack;

alias extern(C) void  function(CFAllocatorRef allocator, const(void)* value) CFSetReleaseCallBack;

alias extern(C) CFStringRef function(const(void)* value) CFSetCopyDescriptionCallBack;

alias extern(C) Boolean  function(const(void)* value1, const(void)* value2) CFSetEqualCallBack;

alias extern(C) CFHashCode function(const(void)* value) CFSetHashCallBack;

struct CFSetCallBacks {
    CFIndex    _version;
    CFSetRetainCallBack   retain;
    CFSetReleaseCallBack  release;
    CFSetCopyDescriptionCallBack copyDescription;
    CFSetEqualCallBack   equal;
    CFSetHashCallBack   hash;
}

extern(C) const CFSetCallBacks kCFTypeSetCallBacks;

extern(C) const CFSetCallBacks kCFCopyStringSetCallBacks;

alias extern(C) void function(const(void)* value, void *context) CFSetApplierFunction;

alias void __CFSet;
alias const(__CFSet)* CFSetRef;

alias __CFSet* CFMutableSetRef;

CFTypeID CFSetGetTypeID();

CFSetRef CFSetCreate(CFAllocatorRef allocator, const(void)** values, CFIndex numValues, const CFSetCallBacks* callBacks);

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet);

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks* callBacks);

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet);

CFIndex CFSetGetCount(CFSetRef theSet);

CFIndex CFSetGetCountOfValue(CFSetRef theSet, const(void)* value);

Boolean CFSetContainsValue(CFSetRef theSet, const(void)* value);

const(void)* CFSetGetValue(CFSetRef theSet, const(void)* value);

Boolean CFSetGetValueIfPresent(CFSetRef theSet, const(void)* candidate, const(void)** value);

void CFSetGetValues(CFSetRef theSet, const(void)** values);

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void* context);

void CFSetAddValue(CFMutableSetRef theSet, const(void)* value);

void CFSetReplaceValue(CFMutableSetRef theSet, const(void)* value);

void CFSetSetValue(CFMutableSetRef theSet, const(void)* value);

void CFSetRemoveValue(CFMutableSetRef theSet, const(void)* value);

void CFSetRemoveAllValues(CFMutableSetRef theSet);

