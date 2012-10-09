/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
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

/*	CFUtilities.c
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
	Responsibility: Tony Parker
*/
module CoreFoundation.CFUtilities;

import std.c.stdarg;
import CoreFoundation.CFBase;
import CoreFoundation.CFURLAccess;
import CoreFoundation.CFPropertyList;
import CoreFoundation.CFTimeZone;
import CoreFoundation.CFCalendar;
import CoreFoundation.CFDictionary;

extern(C):

CFHashCode CFHashBytes(ubyte* bytes, CFIndex length);

CFStringRef CFCopySystemVersionString();

CFDictionaryRef _CFCopySystemVersionDictionary();
CFDictionaryRef _CFCopyServerVersionDictionary();

// message must be a UTF8-encoded, null-terminated, byte buffer with at least length bytes
alias extern(C) void function(int lev, const(char)* message, size_t length, char withBanner) CFLogFunc;

Boolean also_do_stderr();

void CFLog(int lev, CFStringRef format, ...);

alias extern(C) void function() ThrottleTypeA;		// allows calls per nanoseconds
alias extern(C) void function(ulong amt) ThrottleTypeB;	// allows amount per nanoseconds

