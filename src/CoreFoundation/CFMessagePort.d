/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2010 Apple Inc. All rights reserved.
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

/*	CFMessagePort.h
	Copyright (c) 1998-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFMessagePort;

import CoreFoundation.CFBase;
import CoreFoundation.CFString;
import CoreFoundation.CFRunLoop;
import CoreFoundation.CFData;
import CoreFoundation.CFDate;

extern(C):

alias void __CFMessagePort;
alias __CFMessagePort* CFMessagePortRef;

enum {
    kCFMessagePortSuccess = 0,
    kCFMessagePortSendTimeout = -1,
    kCFMessagePortReceiveTimeout = -2,
    kCFMessagePortIsInvalid = -3,
    kCFMessagePortTransportError = -4,
    kCFMessagePortBecameInvalidError = -5
}

struct CFMessagePortContext
{
    CFIndex _version;
    void* info;
    extern(C) const(void)* function(const(void)* info) retain;
    extern(C) void function(const(void)* info) release;
    extern(C) CFStringRef function(const(void)* info) copyDescription;
}

alias extern(C) CFDataRef function(CFMessagePortRef local, SInt32 msgid, CFDataRef data, void* info) CFMessagePortCallBack;
alias extern(C) void function(CFMessagePortRef ms, void* info) CFMessagePortInvalidationCallBack;

extern(C) CFTypeID CFMessagePortGetTypeID();

extern(C) CFMessagePortRef CFMessagePortCreateLocal(CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext* context, Boolean* shouldFreeInfo);
extern(C) CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name);

extern(C) Boolean CFMessagePortIsRemote(CFMessagePortRef ms);
extern(C) CFStringRef CFMessagePortGetName(CFMessagePortRef ms);
extern(C) Boolean CFMessagePortSetName(CFMessagePortRef ms, CFStringRef newName);
extern(C) void CFMessagePortGetContext(CFMessagePortRef ms, CFMessagePortContext* context);
extern(C) void CFMessagePortInvalidate(CFMessagePortRef ms);
extern(C) Boolean CFMessagePortIsValid(CFMessagePortRef ms);
extern(C) CFMessagePortInvalidationCallBack CFMessagePortGetInvalidationCallBack(CFMessagePortRef ms);
extern(C) void CFMessagePortSetInvalidationCallBack(CFMessagePortRef ms, CFMessagePortInvalidationCallBack callout);

extern(C) SInt32 CFMessagePortSendRequest(CFMessagePortRef remote, SInt32 msgid, CFDataRef data, CFTimeInterval sendTimeout, CFTimeInterval rcvTimeout, CFStringRef replyMode, CFDataRef* returnData);

extern(C) CFRunLoopSourceRef CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order);

