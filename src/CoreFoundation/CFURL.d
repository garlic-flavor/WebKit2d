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

/*	CFURL.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFURL;

import CoreFoundation.CFBase;
import CoreFoundation.CFData;
import CoreFoundation.CFString;
import CoreFoundation.CFError;

extern(C):

enum {
    kCFURLPOSIXPathStyle = 0,
    kCFURLHFSPathStyle,
    kCFURLWindowsPathStyle
};
alias CFIndex CFURLPathStyle;

alias void __CFURL;
alias const(__CFURL)* CFURLRef;

CFTypeID CFURLGetTypeID();

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const(UInt8)* URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL);

CFDataRef CFURLCreateData(CFAllocatorRef allocator, CFURLRef url, CFStringEncoding encoding, Boolean escapeWhitespace);

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL);

CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const(UInt8)* relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode);

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory);

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const(UInt8)* buffer, CFIndex bufLen, Boolean isDirectory);

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL); 

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const(UInt8)* buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL);

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8* buffer, CFIndex maxBufLen);

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL);

CFStringRef CFURLGetString(CFURLRef anURL);

CFURLRef CFURLGetBaseURL(CFURLRef anURL);

Boolean CFURLCanBeDecomposed(CFURLRef anURL); 


CFStringRef CFURLCopyScheme(CFURLRef anURL);


CFStringRef CFURLCopyNetLocation(CFURLRef anURL); 

CFStringRef CFURLCopyPath(CFURLRef anURL);

CFStringRef CFURLCopyStrictPath(CFURLRef anURL, Boolean *isAbsolute);

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle);

Boolean CFURLHasDirectoryPath(CFURLRef anURL);

CFStringRef CFURLCopyResourceSpecifier(CFURLRef anURL); 

CFStringRef CFURLCopyHostName(CFURLRef anURL);

SInt32 CFURLGetPortNumber(CFURLRef anURL); /* Returns -1 if no port number is specified */

CFStringRef CFURLCopyUserName(CFURLRef anURL);

CFStringRef CFURLCopyPassword(CFURLRef anURL);

CFStringRef CFURLCopyParameterString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped);

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped);

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped);

CFStringRef CFURLCopyLastPathComponent(CFURLRef url);

CFStringRef CFURLCopyPathExtension(CFURLRef url);


CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory);

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url);

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension);

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url);

CFIndex CFURLGetBytes(CFURLRef url, UInt8* buffer, CFIndex bufferLength);

enum {
	kCFURLComponentScheme = 1,
	kCFURLComponentNetLocation = 2,
	kCFURLComponentPath = 3,
	kCFURLComponentResourceSpecifier = 4,

	kCFURLComponentUser = 5,
	kCFURLComponentPassword = 6,
	kCFURLComponentUserInfo = 7,
	kCFURLComponentHost = 8,
	kCFURLComponentPort = 9,
	kCFURLComponentParameterString = 10,
	kCFURLComponentQuery = 11,
	kCFURLComponentFragment = 12
};
alias CFIndex CFURLComponentType;

CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange* rangeIncludingSeparators);

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped);

CFStringRef CFURLCreateStringByReplacingPercentEscapesUsingEncoding(CFAllocatorRef allocator, CFStringRef origString, CFStringRef charsToLeaveEscaped, CFStringEncoding encoding);


CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding);


CFURLRef CFURLCreateFileReferenceURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef* error);

CFURLRef CFURLCreateFilePathURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef* error);


