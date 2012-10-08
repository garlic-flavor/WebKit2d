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
/*	CFURL.h
	Copyright (c) 1998-2007, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFURL;

import CoreFoundation.CFBase;
import CoreFoundation.CFData;
import CoreFoundation.CFString;

extern(C):

enum {
    kCFURLPOSIXPathStyle = 0,
    kCFURLHFSPathStyle,
    kCFURLWindowsPathStyle
};
alias CFIndex CFURLPathStyle;

alias void __CFURL;
alias const(__CFURL)* CFURLRef;

extern(C) CFTypeID CFURLGetTypeID();

extern(C) CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const(UInt8)* URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL);

extern(C) CFDataRef CFURLCreateData(CFAllocatorRef allocator, CFURLRef url, CFStringEncoding encoding, Boolean escapeWhitespace);

extern(C) CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL);

extern(C) CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const(UInt8)* relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode);

extern(C) CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory);

extern(C) CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const(UInt8)* buffer, CFIndex bufLen, Boolean isDirectory);

extern(C) CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL); 

extern(C) CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const(UInt8)* buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL);

extern(C) Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8* buffer, CFIndex maxBufLen);

extern(C) CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL);

extern(C) CFStringRef CFURLGetString(CFURLRef anURL);

extern(C) CFURLRef CFURLGetBaseURL(CFURLRef anURL);

extern(C) Boolean CFURLCanBeDecomposed(CFURLRef anURL); 


extern(C) CFStringRef CFURLCopyScheme(CFURLRef anURL);


extern(C) CFStringRef CFURLCopyNetLocation(CFURLRef anURL); 

extern(C) CFStringRef CFURLCopyPath(CFURLRef anURL);

extern(C) CFStringRef CFURLCopyStrictPath(CFURLRef anURL, Boolean *isAbsolute);

extern(C) CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle);

extern(C) Boolean CFURLHasDirectoryPath(CFURLRef anURL);

extern(C) CFStringRef CFURLCopyResourceSpecifier(CFURLRef anURL); 

extern(C) CFStringRef CFURLCopyHostName(CFURLRef anURL);

extern(C) SInt32 CFURLGetPortNumber(CFURLRef anURL); /* Returns -1 if no port number is specified */

extern(C) CFStringRef CFURLCopyUserName(CFURLRef anURL);

extern(C) CFStringRef CFURLCopyPassword(CFURLRef anURL);

extern(C) CFStringRef CFURLCopyParameterString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped);

extern(C) CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped);

extern(C) CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped);

extern(C) CFStringRef CFURLCopyLastPathComponent(CFURLRef url);

extern(C) CFStringRef CFURLCopyPathExtension(CFURLRef url);


extern(C) CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory);

extern(C) CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url);

extern(C) CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension);

extern(C) CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url);

extern(C) CFIndex CFURLGetBytes(CFURLRef url, UInt8* buffer, CFIndex bufferLength);

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

extern(C) CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange* rangeIncludingSeparators);

extern(C) CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped);

extern(C) CFStringRef CFURLCreateStringByReplacingPercentEscapesUsingEncoding(CFAllocatorRef allocator, CFStringRef origString, CFStringRef charsToLeaveEscaped, CFStringEncoding encoding);


extern(C) CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding);

