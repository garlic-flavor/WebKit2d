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

/*	CFBag.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFBag;

import CoreFoundation.CFBase;

extern(C):

alias extern(C) const(void)* function(CFAllocatorRef allocator, const(void)* value) CFBagRetainCallBack;
alias extern(C) void function(CFAllocatorRef allocator, const(void)* value) CFBagReleaseCallBack;
alias extern(C) CFStringRef function(const(void)* value) CFBagCopyDescriptionCallBack;
alias extern(C) Boolean function(const(void)* value1, const(void)* value2) CFBagEqualCallBack;
alias extern(C) CFHashCode function(const(void)* value) CFBagHashCallBack;
struct  CFBagCallBacks{
    CFIndex    _version;
    CFBagRetainCallBack   retain;
    CFBagReleaseCallBack  release;
    CFBagCopyDescriptionCallBack copyDescription;
    CFBagEqualCallBack   equal;
    CFBagHashCallBack   hash;
}

extern(C) extern const CFBagCallBacks kCFTypeBagCallBacks;
extern(C) extern const CFBagCallBacks kCFCopyStringBagCallBacks;

alias extern(C) void function(const(void)* value, void* context) CFBagApplierFunction;

alias void __CFBag;
alias const(__CFBag)* CFBagRef;
alias __CFBag* CFMutableBagRef;

CFTypeID CFBagGetTypeID();

CFBagRef CFBagCreate(CFAllocatorRef allocator, const(void)** values, CFIndex numValues, const CFBagCallBacks* callBacks);

CFBagRef CFBagCreateCopy(CFAllocatorRef allocator, CFBagRef theBag);

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const(CFBagCallBacks)* callBacks);

CFMutableBagRef CFBagCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBagRef theBag);

CFIndex CFBagGetCount(CFBagRef theBag);

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const(void)* value);

Boolean CFBagContainsValue(CFBagRef theBag, const(void)* value);

const(void)* CFBagGetValue(CFBagRef theBag, const(void)* value);

Boolean CFBagGetValueIfPresent(CFBagRef theBag, const(void)* candidate, const(void)** value);

void CFBagGetValues(CFBagRef theBag, const(void)** values);

void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void* context);

void CFBagAddValue(CFMutableBagRef theBag, const(void)* value);

void CFBagReplaceValue(CFMutableBagRef theBag, const(void)* value);

void CFBagSetValue(CFMutableBagRef theBag, const(void)* value);

void CFBagRemoveValue(CFMutableBagRef theBag, const(void)* value);

void CFBagRemoveAllValues(CFMutableBagRef theBag);
