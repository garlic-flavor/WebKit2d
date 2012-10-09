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

/*	CFURLAccess.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFURLAccess;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFData;
import CoreFoundation.CFDictionary;
import CoreFoundation.CFString;
import CoreFoundation.CFURL;

extern(C):

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef* resourceData, CFDictionaryRef* properties, CFArrayRef desiredProperties, SInt32* errorCode);

Boolean CFURLWriteDataAndPropertiesToResource(CFURLRef url, CFDataRef dataToWrite, CFDictionaryRef propertiesToWrite, SInt32* errorCode);

Boolean CFURLDestroyResource(CFURLRef url, SInt32* errorCode);

CFTypeRef CFURLCreatePropertyFromResource(CFAllocatorRef alloc, CFURLRef url, CFStringRef prop, SInt32* errorCode);

enum CFURLError {
    kCFURLUnknownError = -10,
    kCFURLUnknownSchemeError = -11,
    kCFURLResourceNotFoundError = -12,
    kCFURLResourceAccessViolationError = -13,
    kCFURLRemoteHostUnavailableError = -14,
    kCFURLImproperArgumentsError = -15,
    kCFURLUnknownPropertyKeyError = -16,
    kCFURLPropertyKeyUnavailableError = -17,
    kCFURLTimeoutError = -18
};


extern(C) extern const CFStringRef kCFURLFileExists;
extern(C) extern const CFStringRef kCFURLFileDirectoryContents;
extern(C) extern const CFStringRef kCFURLFileLength;
extern(C) extern const CFStringRef kCFURLFileLastModificationTime;
extern(C) extern const CFStringRef kCFURLFilePOSIXMode;
extern(C) extern const CFStringRef kCFURLFileOwnerID;
extern(C) extern const CFStringRef kCFURLHTTPStatusCode;
extern(C) extern const CFStringRef kCFURLHTTPStatusLine;

