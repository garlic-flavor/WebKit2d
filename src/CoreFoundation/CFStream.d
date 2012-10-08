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
/*	CFStream.h
	Copyright (c) 2000-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFStream;

import CoreFoundation.CFBase;
import CoreFoundation.CFString;
import CoreFoundation.CFDictionary;
import CoreFoundation.CFURL;
import CoreFoundation.CFRunLoop;
import CoreFoundation.CFSocket;
import CoreFoundation.CFError;

extern(C):

enum {
    kCFStreamStatusNotOpen = 0,
    kCFStreamStatusOpening,  /* open is in-progress */
    kCFStreamStatusOpen,
    kCFStreamStatusReading,
    kCFStreamStatusWriting,
    kCFStreamStatusAtEnd,    /* no further bytes can be read/written */
    kCFStreamStatusClosed,
    kCFStreamStatusError
}
alias CFIndex CFStreamStatus;

enum {
    kCFStreamEventNone = 0,
    kCFStreamEventOpenCompleted = 1,
    kCFStreamEventHasBytesAvailable = 2,
    kCFStreamEventCanAcceptBytes = 4, 
    kCFStreamEventErrorOccurred = 8,
    kCFStreamEventEndEncountered = 16
}
alias CFOptionFlags CFStreamEventType;

struct CFStreamClientContext{
    CFIndex _version;
    void* info;
    extern(C) void* function(void* info) retain;
    extern(C) void function(void* info) release;
    extern(C) CFStringRef function(void* info) copyDescription;
}

alias void __CFReadStream;
alias __CFReadStream* CFReadStreamRef;
alias void __CFWriteStream;
alias __CFWriteStream* CFWriteStreamRef;

alias extern(C) void function(CFReadStreamRef stream, CFStreamEventType type, void* clientCallBackInfo) CFReadStreamClientCallBack;
alias extern(C) void function(CFWriteStreamRef stream, CFStreamEventType type, void* clientCallBackInfo) CFWriteStreamClientCallBack;

extern(C) CFTypeID CFReadStreamGetTypeID();
extern(C) CFTypeID CFWriteStreamGetTypeID();

extern(C) extern const CFStringRef kCFStreamPropertyDataWritten;

extern(C) CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const(UInt8)* bytes, CFIndex length, CFAllocatorRef bytesDeallocator);

extern(C) CFWriteStreamRef CFWriteStreamCreateWithBuffer(CFAllocatorRef alloc, UInt8* buffer, CFIndex bufferCapacity);

extern(C) CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator);

extern(C) CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL);
extern(C) CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL);
extern(C) void CFStreamCreateBoundPair(CFAllocatorRef alloc, CFReadStreamRef* readStream, CFWriteStreamRef* writeStream, CFIndex transferBufferSize);

extern(C) extern const CFStringRef kCFStreamPropertyAppendToFile;

extern(C) extern const CFStringRef kCFStreamPropertyFileCurrentOffset;   // Value is a CFNumber


extern(C) extern const CFStringRef kCFStreamPropertySocketNativeHandle;

extern(C) extern const CFStringRef kCFStreamPropertySocketRemoteHostName;

extern(C) extern const CFStringRef kCFStreamPropertySocketRemotePortNumber;

extern(C) void CFStreamCreatePairWithSocket(CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef* readStream, CFWriteStreamRef* writeStream);
extern(C) void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef* readStream, CFWriteStreamRef* writeStream);
extern(C) void CFStreamCreatePairWithPeerSocketSignature(CFAllocatorRef alloc, const(CFSocketSignature)* signature, CFReadStreamRef* readStream, CFWriteStreamRef* writeStream);


extern(C) CFStreamStatus CFReadStreamGetStatus(CFReadStreamRef stream);
extern(C) CFStreamStatus CFWriteStreamGetStatus(CFWriteStreamRef stream);

extern(C) CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream);
extern(C) CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream);

extern(C) Boolean CFReadStreamOpen(CFReadStreamRef stream);
extern(C) Boolean CFWriteStreamOpen(CFWriteStreamRef stream);

extern(C) void CFReadStreamClose(CFReadStreamRef stream);
extern(C) void CFWriteStreamClose(CFWriteStreamRef stream);

extern(C) Boolean CFReadStreamHasBytesAvailable(CFReadStreamRef stream);

extern(C) CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8* buffer, CFIndex bufferLength);

extern(C) const(UInt8)* CFReadStreamGetBuffer(CFReadStreamRef stream, CFIndex maxBytesToRead, CFIndex* numBytesRead);

extern(C) Boolean CFWriteStreamCanAcceptBytes(CFWriteStreamRef stream);

extern(C) CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const(UInt8)* buffer, CFIndex bufferLength);

extern(C) CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStringRef propertyName);
extern(C) CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStringRef propertyName);

extern(C) Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStringRef propertyName, CFTypeRef propertyValue);
extern(C) Boolean CFWriteStreamSetProperty(CFWriteStreamRef stream, CFStringRef propertyName, CFTypeRef propertyValue);

extern(C) Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext* clientContext);
extern(C) Boolean CFWriteStreamSetClient(CFWriteStreamRef stream, CFOptionFlags streamEvents, CFWriteStreamClientCallBack clientCB, CFStreamClientContext* clientContext);

extern(C) void CFReadStreamScheduleWithRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFStringRef runLoopMode);
extern(C) void CFWriteStreamScheduleWithRunLoop(CFWriteStreamRef stream, CFRunLoopRef runLoop, CFStringRef runLoopMode);

extern(C) void CFReadStreamUnscheduleFromRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFStringRef runLoopMode);
extern(C) void CFWriteStreamUnscheduleFromRunLoop(CFWriteStreamRef stream, CFRunLoopRef runLoop, CFStringRef runLoopMode);


enum {
    kCFStreamErrorDomainCustom = -1,      /* custom to the kind of stream in question */
    kCFStreamErrorDomainPOSIX = 1,        /* POSIX errno; interpret using <sys/errno.h> */
    kCFStreamErrorDomainMacOSStatus      /* OSStatus type from Carbon APIs; interpret using <MacTypes.h> */
}
alias CFIndex CFStreamErrorDomain;

struct  CFStreamError {
    CFIndex domain; 
    SInt32 error;
}
extern(C) CFStreamError CFReadStreamGetError(CFReadStreamRef stream);
extern(C) CFStreamError CFWriteStreamGetError(CFWriteStreamRef stream);

