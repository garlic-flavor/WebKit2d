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
/*	CFBag.h
	Copyright (c) 1998-2003, Apple, Inc. All rights reserved.
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

extern(C) CFTypeID CFBagGetTypeID();

extern(C) CFBagRef CFBagCreate(CFAllocatorRef allocator, const(void)** values, CFIndex numValues, const CFBagCallBacks* callBacks);

extern(C) CFBagRef CFBagCreateCopy(CFAllocatorRef allocator, CFBagRef theBag);

extern(C) CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const(CFBagCallBacks)* callBacks);

extern(C) CFMutableBagRef CFBagCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBagRef theBag);

extern(C) CFIndex CFBagGetCount(CFBagRef theBag);

extern(C) CFIndex CFBagGetCountOfValue(CFBagRef theBag, const(void)* value);

extern(C) Boolean CFBagContainsValue(CFBagRef theBag, const(void)* value);

extern(C) const(void)* CFBagGetValue(CFBagRef theBag, const(void)* value);

extern(C) Boolean CFBagGetValueIfPresent(CFBagRef theBag, const(void)* candidate, const(void)** value);

extern(C) void CFBagGetValues(CFBagRef theBag, const(void)** values);

extern(C) void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void* context);

extern(C) void CFBagAddValue(CFMutableBagRef theBag, const(void)* value);

extern(C) void CFBagReplaceValue(CFMutableBagRef theBag, const(void)* value);

extern(C) void CFBagSetValue(CFMutableBagRef theBag, const(void)* value);

extern(C) void CFBagRemoveValue(CFMutableBagRef theBag, const(void)* value);

extern(C) void CFBagRemoveAllValues(CFMutableBagRef theBag);
