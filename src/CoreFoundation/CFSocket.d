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
/*	CFSocket.h
	Copyright (c) 1999-2007, Apple Inc.  All rights reserved.
*/

module CoreFoundation.CFSocket;

alias int CFSocketNativeHandle;

import CoreFoundation.CFBase;
import CoreFoundation.CFRunLoop;
import CoreFoundation.CFData;
import CoreFoundation.CFDate;

extern(C):

alias void __CFSocket;
alias __CFSocket* CFSocketRef;

enum {
    kCFSocketSuccess = 0,
    kCFSocketError = -1,
    kCFSocketTimeout = -2
}
alias CFIndex CFSocketError;

struct CFSocketSignature
{
    SInt32	protocolFamily;
    SInt32	socketType;
    SInt32	protocol;
    CFDataRef	address;
}

/* Values for CFSocketCallBackType */
enum {
    kCFSocketNoCallBack = 0,
    kCFSocketReadCallBack = 1,
    kCFSocketAcceptCallBack = 2,
    kCFSocketDataCallBack = 3,
    kCFSocketConnectCallBack = 4
    ,
    kCFSocketWriteCallBack = 8
};
alias CFOptionFlags CFSocketCallBackType;

enum {
    kCFSocketAutomaticallyReenableReadCallBack = 1,
    kCFSocketAutomaticallyReenableAcceptCallBack = 2,
    kCFSocketAutomaticallyReenableDataCallBack = 3,
    kCFSocketAutomaticallyReenableWriteCallBack = 8,
    kCFSocketCloseOnInvalidate = 128
}

alias extern(C) void function(CFSocketRef s, CFSocketCallBackType type, CFDataRef address, const(void)* data, void* info) CFSocketCallBack;
/* If the callback wishes to keep hold of address or data after the point that it returns, then it must copy them. */

struct CFSocketContext{
    CFIndex	_version;
    void*	info;
    extern(C) const(void)* function(const(void)* info) retain;
    extern(C) void function(const(void)* info) release;
    extern(C) CFStringRef function(const(void)* info) copyDescription;
}

extern(C) CFTypeID	CFSocketGetTypeID();

extern(C) CFSocketRef	CFSocketCreate(CFAllocatorRef allocator, SInt32 protocolFamily, SInt32 socketType, SInt32 protocol, CFOptionFlags callBackTypes, CFSocketCallBack callout, const(CFSocketContext)* context);
extern(C) CFSocketRef	CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const(CFSocketContext)* context);
extern(C) CFSocketRef	CFSocketCreateWithSocketSignature(CFAllocatorRef allocator, const CFSocketSignature *signature, CFOptionFlags callBackTypes, CFSocketCallBack callout, const(CFSocketContext)* context);
extern(C) CFSocketRef	CFSocketCreateConnectedToSocketSignature(CFAllocatorRef allocator, const(CFSocketSignature)* signature, CFOptionFlags callBackTypes, CFSocketCallBack callout, const(CFSocketContext)* context, CFTimeInterval timeout);

extern(C) CFSocketError	CFSocketSetAddress(CFSocketRef s, CFDataRef address);
extern(C) CFSocketError	CFSocketConnectToAddress(CFSocketRef s, CFDataRef address, CFTimeInterval timeout);
extern(C) void		CFSocketInvalidate(CFSocketRef s);

extern(C) Boolean	CFSocketIsValid(CFSocketRef s);
extern(C) CFDataRef	CFSocketCopyAddress(CFSocketRef s);
extern(C) CFDataRef	CFSocketCopyPeerAddress(CFSocketRef s);
extern(C) void		CFSocketGetContext(CFSocketRef s, CFSocketContext* context);
extern(C) CFSocketNativeHandle	CFSocketGetNative(CFSocketRef s);

extern(C) CFRunLoopSourceRef	CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order);

extern(C) CFOptionFlags	CFSocketGetSocketFlags(CFSocketRef s);
extern(C) void		CFSocketSetSocketFlags(CFSocketRef s, CFOptionFlags flags);
extern(C) void		CFSocketDisableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes);
extern(C) void		CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes);

extern(C) CFSocketError	CFSocketSendData(CFSocketRef s, CFDataRef address, CFDataRef data, CFTimeInterval timeout);

extern(C) CFSocketError	CFSocketRegisterValue(const(CFSocketSignature)* nameServerSignature, CFTimeInterval timeout, CFStringRef name, CFPropertyListRef value);
extern(C) CFSocketError	CFSocketCopyRegisteredValue(const(CFSocketSignature)* nameServerSignature, CFTimeInterval timeout, CFStringRef name, CFPropertyListRef* value, CFDataRef* nameServerAddress);

extern(C) CFSocketError	CFSocketRegisterSocketSignature(const(CFSocketSignature)* nameServerSignature, CFTimeInterval timeout, CFStringRef name, const(CFSocketSignature)* signature);
extern(C) CFSocketError	CFSocketCopyRegisteredSocketSignature(const(CFSocketSignature)* nameServerSignature, CFTimeInterval timeout, CFStringRef name, CFSocketSignature* signature, CFDataRef* nameServerAddress);

extern(C) CFSocketError	CFSocketUnregister(const(CFSocketSignature)* nameServerSignature, CFTimeInterval timeout, CFStringRef name);

extern(C) void		CFSocketSetDefaultNameRegistryPortNumber(UInt16 port);
extern(C) UInt16	CFSocketGetDefaultNameRegistryPortNumber();

extern(C) extern const CFStringRef kCFSocketCommandKey;
extern(C) extern const CFStringRef kCFSocketNameKey;
extern(C) extern const CFStringRef kCFSocketValueKey;
extern(C) extern const CFStringRef kCFSocketResultKey;
extern(C) extern const CFStringRef kCFSocketErrorKey;
extern(C) extern const CFStringRef kCFSocketRegisterCommand;
extern(C) extern const CFStringRef kCFSocketRetrieveCommand;

