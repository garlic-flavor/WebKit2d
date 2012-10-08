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
/*	CFDictionary.h
	Copyright 1998-1999, Apple Computer, Inc. All rights reserved.
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

extern(C) CFTypeID CFDictionaryGetTypeID();

extern(C) CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const(void)** keys, const(void)** values, CFIndex numValues, const(CFDictionaryKeyCallBacks)* keyCallBacks, const(CFDictionaryValueCallBacks)* valueCallBacks);

extern(C) CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict);

extern(C) CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const(CFDictionaryKeyCallBacks)* keyCallBacks, const(CFDictionaryValueCallBacks)* valueCallBacks);

extern(C) CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict);

extern(C) CFIndex CFDictionaryGetCount(CFDictionaryRef theDict);

extern(C) CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const(void)* key);

extern(C) CFIndex CFDictionaryGetCountOfValue(CFDictionaryRef theDict, const(void)* value);

extern(C) Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const(void)* key);

extern(C) Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const(void)* value);

extern(C) const(void)* CFDictionaryGetValue(CFDictionaryRef theDict, const(void)* key);

extern(C) Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const(void)* key, const(void)** value);

extern(C) void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const(void)** keys, const(void)** values);

extern(C) void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void* context);

extern(C) void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const(void)* key, const(void)* value);

extern(C) void CFDictionarySetValue(CFMutableDictionaryRef theDict, const(void)*key, const(void)* value);

extern(C) void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const(void)* key, const(void)* value);

extern(C) void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const(void)* key);

extern(C) void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict);

