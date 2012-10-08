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
/*	CFPreferences.h
	Copyright (c) 1998-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFPreferences;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFString;
import CoreFoundation.CFDictionary;

extern(C):

extern(C) extern const CFStringRef kCFPreferencesAnyApplication;
extern(C) extern const CFStringRef kCFPreferencesCurrentApplication;
extern(C) extern const CFStringRef kCFPreferencesAnyHost;
extern(C) extern const CFStringRef kCFPreferencesCurrentHost;
extern(C) extern const CFStringRef kCFPreferencesAnyUser;
extern(C) extern const CFStringRef kCFPreferencesCurrentUser;

extern(C) CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID);

extern(C) Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean* keyExistsAndHasValidFormat);

extern(C) CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean* keyExistsAndHasValidFormat);

extern(C) void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID);

extern(C) void CFPreferencesAddSuitePreferencesToApp(CFStringRef applicationID, CFStringRef suiteID);

extern(C) void CFPreferencesRemoveSuitePreferencesFromApp(CFStringRef applicationID, CFStringRef suiteID);

extern(C) Boolean CFPreferencesAppSynchronize(CFStringRef applicationID);

extern(C) CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

extern(C) CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

extern(C) void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

extern(C) void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

extern(C) Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

extern(C) CFArrayRef CFPreferencesCopyApplicationList(CFStringRef userName, CFStringRef hostName);

extern(C) CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

