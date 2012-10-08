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

/*	CFMachPort.h
	Copyright (c) 1998-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFMachPort;

import CoreFoundation.CFBase;
import CoreFoundation.CFRunLoop;

extern(C):

alias void __CFMachPort;
alias __CFMachPort* CFMachPortRef;

struct CFMachPortContext
{
    CFIndex	_version;
    void*	info;
    extern(C) const(void)* function(const(void)* info) retain;
    extern(C) void function(const(void)* info) release;
    extern(C) CFStringRef function(const(void)* info) copyDescription;
}

alias extern(C) void function(CFMachPortRef port, void* msg, CFIndex size, void* info) CFMachPortCallBack;
alias extern(C) void function(CFMachPortRef port, void* info) CFMachPortInvalidationCallBack;

extern(C) CFTypeID	CFMachPortGetTypeID();

extern(C) CFMachPortRef	CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext* context, Boolean* shouldFreeInfo);
extern(C) CFMachPortRef	CFMachPortCreateWithPort(CFAllocatorRef allocator,/* mach_port_t*/uint portNum, CFMachPortCallBack callout, CFMachPortContext* context, Boolean* shouldFreeInfo);

extern(C) /*mach_port_t*/uint CFMachPortGetPort(CFMachPortRef port);
extern(C) void CFMachPortGetContext(CFMachPortRef port, CFMachPortContext* context);
extern(C) void CFMachPortInvalidate(CFMachPortRef port);
extern(C) Boolean CFMachPortIsValid(CFMachPortRef port);
extern(C) CFMachPortInvalidationCallBack CFMachPortGetInvalidationCallBack(CFMachPortRef port);
extern(C) void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout);

extern(C) CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order);
