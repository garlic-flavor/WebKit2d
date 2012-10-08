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
/*	CFSet.h
	Copyright (c) 1998-2007, Apple Inc. All rights reserved.
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

extern(C) extern const CFSetCallBacks kCFTypeSetCallBacks;

extern(C) extern const CFSetCallBacks kCFCopyStringSetCallBacks;

alias extern(C) void function(const(void)* value, void *context) CFSetApplierFunction;

alias void __CFSet;
alias const(__CFSet)* CFSetRef;

alias __CFSet* CFMutableSetRef;

extern(C) CFTypeID CFSetGetTypeID();

extern(C) CFSetRef CFSetCreate(CFAllocatorRef allocator, const(void)** values, CFIndex numValues, const CFSetCallBacks* callBacks);

extern(C) CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet);

extern(C) CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks* callBacks);

extern(C) CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet);

extern(C) CFIndex CFSetGetCount(CFSetRef theSet);

extern(C) CFIndex CFSetGetCountOfValue(CFSetRef theSet, const(void)* value);

extern(C) Boolean CFSetContainsValue(CFSetRef theSet, const(void)* value);

extern(C) const(void)* CFSetGetValue(CFSetRef theSet, const(void)* value);

extern(C) Boolean CFSetGetValueIfPresent(CFSetRef theSet, const(void)* candidate, const(void)** value);

extern(C) void CFSetGetValues(CFSetRef theSet, const(void)** values);

extern(C) void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void* context);

extern(C) void CFSetAddValue(CFMutableSetRef theSet, const(void)* value);

extern(C) void CFSetReplaceValue(CFMutableSetRef theSet, const(void)* value);

extern(C) void CFSetSetValue(CFMutableSetRef theSet, const(void)* value);

extern(C) void CFSetRemoveValue(CFMutableSetRef theSet, const(void)* value);

extern(C) void CFSetRemoveAllValues(CFMutableSetRef theSet);

