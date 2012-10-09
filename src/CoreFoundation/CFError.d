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

/*	CFError.h
	Copyright (c) 2006-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFError;

import CoreFoundation.CFBase;
import CoreFoundation.CFString;
import CoreFoundation.CFDictionary;

extern(C):

alias void __CFError;
alias __CFError* CFErrorRef;

CFTypeID CFErrorGetTypeID();


extern(C) extern const CFStringRef kCFErrorDomainPOSIX;
extern(C) extern const CFStringRef kCFErrorDomainOSStatus;
extern(C) extern const CFStringRef kCFErrorDomainMach;
extern(C) extern const CFStringRef kCFErrorDomainCocoa;

extern(C) extern const CFStringRef kCFErrorLocalizedDescriptionKey;
extern(C) extern const CFStringRef kCFErrorLocalizedFailureReasonKey;
extern(C) extern const CFStringRef kCFErrorLocalizedRecoverySuggestionKey;

extern(C) extern const CFStringRef kCFErrorDescriptionKey;

extern(C) extern const CFStringRef kCFErrorUnderlyingErrorKey;
extern(C) extern const CFStringRef kCFErrorURLKey;
extern(C) extern const CFStringRef kCFErrorFilePathKey;

extern(C) CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFStringRef domain, CFIndex code, CFDictionaryRef userInfo);

extern(C) CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFStringRef domain, CFIndex code, const(const(void)*)* userInfoKeys, const(const(void)*)* userInfoValues, CFIndex numUserInfoValues);

extern(C) CFStringRef CFErrorGetDomain(CFErrorRef err);

extern(C) CFIndex CFErrorGetCode(CFErrorRef err);

extern(C) CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err);

extern(C) CFStringRef CFErrorCopyDescription(CFErrorRef err);

extern(C) CFStringRef CFErrorCopyFailureReason(CFErrorRef err);

extern(C) CFStringRef CFErrorCopyRecoverySuggestion(CFErrorRef err);

