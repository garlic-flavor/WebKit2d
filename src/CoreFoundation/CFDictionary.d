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

/*	CFDictionary.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFDictionary;

import CoreFoundation.CFBase;

extern(C):

alias extern(C) const(void)* function(CFAllocatorRef allocator, const(void)* value) CFDictionaryRetainCallBack;
alias extern(C) void function(CFAllocatorRef allocator, const(void)* value) CFDictionaryReleaseCallBack;
alias extern(C) CFStringRef function(const(void)* value) CFDictionaryCopyDescriptionCallBack;
alias extern(C) Boolean function(const(void)* value1, const void *value2) CFDictionaryEqualCallBack;
alias extern(C) CFHashCode function(const(void)* value) CFDictionaryHashCallBack;

struct CFDictionaryKeyCallBacks
{
    CFIndex				_version;
    CFDictionaryRetainCallBack		retain;
    CFDictionaryReleaseCallBack		release;
    CFDictionaryCopyDescriptionCallBack	copyDescription;
    CFDictionaryEqualCallBack		equal;
    CFDictionaryHashCallBack		hash;
}

extern(C) extern const CFDictionaryKeyCallBacks kCFTypeDictionaryKeyCallBacks;

extern(C) extern const CFDictionaryKeyCallBacks kCFCopyStringDictionaryKeyCallBacks;

struct CFDictionaryValueCallBacks
{
    CFIndex				_version;
    CFDictionaryRetainCallBack		retain;
    CFDictionaryReleaseCallBack		release;
    CFDictionaryCopyDescriptionCallBack	copyDescription;
    CFDictionaryEqualCallBack		equal;
}

extern(C) extern const CFDictionaryValueCallBacks kCFTypeDictionaryValueCallBacks;

alias extern(C) void function(const(void)* key, const(void)* value, void* context) CFDictionaryApplierFunction;

alias void __CFDictionary;
alias const(__CFDictionary)* CFDictionaryRef;

alias __CFDictionary* CFMutableDictionaryRef;

CFTypeID CFDictionaryGetTypeID();

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const(void)** keys, const(void)** values, CFIndex numValues, const(CFDictionaryKeyCallBacks)* keyCallBacks, const(CFDictionaryValueCallBacks)* valueCallBacks);

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict);

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const(CFDictionaryKeyCallBacks)* keyCallBacks, const(CFDictionaryValueCallBacks)* valueCallBacks);

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict);

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict);

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const(void)* key);

CFIndex CFDictionaryGetCountOfValue(CFDictionaryRef theDict, const(void)* value);

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const(void)* key);

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const(void)* value);

const(void)* CFDictionaryGetValue(CFDictionaryRef theDict, const(void)* key);

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const(void)* key, const(void)** value);

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const(void)** keys, const(void)** values);

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void* context);

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const(void)* key, const(void)* value);

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const(void)*key, const(void)* value);

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const(void)* key, const(void)* value);

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const(void)* key);

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict);

