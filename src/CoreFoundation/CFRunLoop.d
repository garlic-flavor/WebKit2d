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
/*	CFRunLoop.h
	Copyright (c) 1998-2007, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFRunLoop;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFDate;
import CoreFoundation.CFString;

extern(C):

alias void __CFRunLoop;
alias __CFRunLoop* CFRunLoopRef;

alias void __CFRunLoopSource;
alias __CFRunLoopSource* CFRunLoopSourceRef;

alias void __CFRunLoopObserver;
alias __CFRunLoopObserver* CFRunLoopObserverRef;

alias void __CFRunLoopTimer;
alias __CFRunLoopTimer* CFRunLoopTimerRef;

enum {
    kCFRunLoopRunFinished = 1,
    kCFRunLoopRunStopped = 2,
    kCFRunLoopRunTimedOut = 3,
    kCFRunLoopRunHandledSource = 4
}

enum {
    kCFRunLoopEntry = (1 << 0),
    kCFRunLoopBeforeTimers = (1 << 1),
    kCFRunLoopBeforeSources = (1 << 2),
    kCFRunLoopBeforeWaiting = (1 << 5),
    kCFRunLoopAfterWaiting = (1 << 6),
    kCFRunLoopExit = (1 << 7),
    kCFRunLoopAllActivities = 0x0FFFFFFFU
}
alias CFOptionFlags CFRunLoopActivity;

extern(C) extern const CFStringRef kCFRunLoopDefaultMode;
extern(C) extern const CFStringRef kCFRunLoopCommonModes;

extern(C) CFTypeID CFRunLoopGetTypeID();

extern(C) CFRunLoopRef CFRunLoopGetCurrent();
extern(C) CFRunLoopRef CFRunLoopGetMain();

extern(C) CFStringRef CFRunLoopCopyCurrentMode(CFRunLoopRef rl);

extern(C) CFArrayRef CFRunLoopCopyAllModes(CFRunLoopRef rl);

extern(C) void CFRunLoopAddCommonMode(CFRunLoopRef rl, CFStringRef mode);

extern(C) CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFStringRef mode);

extern(C) void CFRunLoopRun();
extern(C) SInt32 CFRunLoopRunInMode(CFStringRef mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled);
extern(C) Boolean CFRunLoopIsWaiting(CFRunLoopRef rl);
extern(C) void CFRunLoopWakeUp(CFRunLoopRef rl);
extern(C) void CFRunLoopStop(CFRunLoopRef rl);

extern(C) Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFStringRef mode);
extern(C) void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFStringRef mode);
extern(C) void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFStringRef mode);

extern(C) Boolean CFRunLoopContainsObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFStringRef mode);
extern(C) void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFStringRef mode);
extern(C) void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFStringRef mode);

extern(C) Boolean CFRunLoopContainsTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFStringRef mode);
extern(C) void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFStringRef mode);
extern(C) void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFStringRef mode);

struct  CFRunLoopSourceContext{
    CFIndex	_version;
    void*	info;
    extern(C) const(void)* function(const(void)* info) retain;
    extern(C) void function(const(void)* info) release;
    extern(C) CFStringRef function(const(void)* info) copyDescription;
    extern(C) Boolean function(const(void)* info1, const(void)* info2) equal;
    extern(C) CFHashCode function(const(void)* info) hash;
    extern(C) void function(void* info, CFRunLoopRef rl, CFStringRef mode) schedule;
    extern(C) void function(void* info, CFRunLoopRef rl, CFStringRef mode) cancel;
    extern(C) void function(void* info) perform;
}

struct CFRunLoopSourceContext1 {
    CFIndex	_version;
    void*	info;
    extern(C) const void* function(const(void)* info) retain;
    extern(C) void function(const(void)* info) release;
    extern(C) CFStringRef function(const(void)* info) copyDescription;
    extern(C) Boolean function(const(void)* info1, const(void)* info2) equal;
    extern(C) CFHashCode function(const(void)* info) hash;
version( MACH )
{
//    mach_port_t	(*getPort)(void *info);
//    void *	(*perform)(void *msg, CFIndex size, CFAllocatorRef allocator, void *info);
}
else
{
    /*HANDLE*/extern(C) void* function(void* info) getPort;
    extern(C) void function(void *info) perform;
}
}

extern(C) CFTypeID CFRunLoopSourceGetTypeID();

extern(C) CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext* context);

extern(C) CFIndex CFRunLoopSourceGetOrder(CFRunLoopSourceRef source);
extern(C) void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source);
extern(C) Boolean CFRunLoopSourceIsValid(CFRunLoopSourceRef source);
extern(C) void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext* context);
extern(C) void CFRunLoopSourceSignal(CFRunLoopSourceRef source);

struct CFRunLoopObserverContext
{
    CFIndex _version;
    void* nfo;
    extern(C) const void* function(const(void)* info) retain;
    extern(C) void function(const(void)* info) release;
    extern(C) CFStringRef function(const(void)* info) copyDescription;
}

alias extern(C) void function(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void* info) CFRunLoopObserverCallBack;

extern(C) CFTypeID CFRunLoopObserverGetTypeID();

extern(C) CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext* context);

extern(C) CFOptionFlags CFRunLoopObserverGetActivities(CFRunLoopObserverRef observer);
extern(C) Boolean CFRunLoopObserverDoesRepeat(CFRunLoopObserverRef observer);
extern(C) CFIndex CFRunLoopObserverGetOrder(CFRunLoopObserverRef observer);
extern(C) void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer);
extern(C) Boolean CFRunLoopObserverIsValid(CFRunLoopObserverRef observer);
extern(C) void CFRunLoopObserverGetContext(CFRunLoopObserverRef observer, CFRunLoopObserverContext* context);

struct CFRunLoopTimerContext{
    CFIndex _version;
    void*	info;
    extern(C) const(void)* function(const(void)* info) retain;
    extern(C) void function(const(void)* info) release;
    extern(C) CFStringRef function(const(void)* info) copyDescription;
}

alias extern(C) void function(CFRunLoopTimerRef timer, void* info) CFRunLoopTimerCallBack;

extern(C) CFTypeID CFRunLoopTimerGetTypeID();

extern(C) CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext* context);
extern(C) CFAbsoluteTime CFRunLoopTimerGetNextFireDate(CFRunLoopTimerRef timer);
extern(C) void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate);
extern(C) CFTimeInterval CFRunLoopTimerGetInterval(CFRunLoopTimerRef timer);
extern(C) Boolean CFRunLoopTimerDoesRepeat(CFRunLoopTimerRef timer);
extern(C) CFIndex CFRunLoopTimerGetOrder(CFRunLoopTimerRef timer);
extern(C) void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer);
extern(C) Boolean CFRunLoopTimerIsValid(CFRunLoopTimerRef timer);
extern(C) void CFRunLoopTimerGetContext(CFRunLoopTimerRef timer, CFRunLoopTimerContext* context);

