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
/*	CFBase.h
	Copyright (c) 1998-2007, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFBase;

alias ubyte           Boolean;
alias ubyte           UInt8;
alias char            SInt8;
alias ushort          UInt16;
alias short           SInt16;
alias uint            UInt32;
alias int             SInt32;
alias ulong           UInt64;
alias long            SInt64;
alias int             OSStatus;

alias float           Float32;
alias double          Float64;
alias ushort          UniChar;
alias ubyte *         StringPtr;
alias const(ubyte)*   ConstStringPtr;
alias ubyte[256]      Str255;
alias const(ubyte)*   ConstStr255Param;
alias SInt16          OSErr;
alias SInt16          RegionCode;
alias SInt16          LangCode;

alias UInt32          UTF32Char;
alias UInt16          UTF16Char;
alias UInt8           UTF8Char;

extern(C):

enum NULL = null;

enum TRUE = 1;
enum FALSE = 0;


enum kCFCoreFoundationVersionNumber10_0 = 196.40;
enum kCFCoreFoundationVersionNumber10_0_3 = 196.50;
enum kCFCoreFoundationVersionNumber10_1 = 226.00;
enum kCFCoreFoundationVersionNumber10_1_1 = 226.00;
/* Note the next three do not follow the usual numbering policy from the base release */
enum kCFCoreFoundationVersionNumber10_1_2 = 227.20;
enum kCFCoreFoundationVersionNumber10_1_3 = 227.20;
enum kCFCoreFoundationVersionNumber10_1_4 = 227.30;
enum kCFCoreFoundationVersionNumber10_2 = 263.00;
enum kCFCoreFoundationVersionNumber10_2_1 = 263.10;
enum kCFCoreFoundationVersionNumber10_2_2 = 263.10;
enum kCFCoreFoundationVersionNumber10_2_3 = 263.30;
enum kCFCoreFoundationVersionNumber10_2_4 = 263.30;
enum kCFCoreFoundationVersionNumber10_2_5 = 263.50;
enum kCFCoreFoundationVersionNumber10_2_6 = 263.50;
enum kCFCoreFoundationVersionNumber10_2_7 = 263.50;
enum kCFCoreFoundationVersionNumber10_2_8 = 263.50;
enum kCFCoreFoundationVersionNumber10_3 = 299.00;
enum kCFCoreFoundationVersionNumber10_3_1 = 299.00;
enum kCFCoreFoundationVersionNumber10_3_2 = 299.00;
enum kCFCoreFoundationVersionNumber10_3_3 = 299.30;
enum kCFCoreFoundationVersionNumber10_3_4 = 299.31;
enum kCFCoreFoundationVersionNumber10_3_5 = 299.31;
enum kCFCoreFoundationVersionNumber10_3_6 = 299.32;
enum kCFCoreFoundationVersionNumber10_3_7 = 299.33;
enum kCFCoreFoundationVersionNumber10_3_8 = 299.33;
enum kCFCoreFoundationVersionNumber10_3_9 = 299.35;
enum kCFCoreFoundationVersionNumber10_4 = 368.00;
enum kCFCoreFoundationVersionNumber10_4_1 = 368.10;
enum kCFCoreFoundationVersionNumber10_4_2 = 368.11;
enum kCFCoreFoundationVersionNumber10_4_3 = 368.18;
enum kCFCoreFoundationVersionNumber10_4_4_Intel = 368.26;
enum kCFCoreFoundationVersionNumber10_4_4_PowerPC = 368.25;
enum kCFCoreFoundationVersionNumber10_4_5_Intel = 368.26;
enum kCFCoreFoundationVersionNumber10_4_5_PowerPC = 368.25;
enum kCFCoreFoundationVersionNumber10_4_6_Intel = 368.26;
enum kCFCoreFoundationVersionNumber10_4_6_PowerPC = 368.25;
enum kCFCoreFoundationVersionNumber10_4_7 = 368.27;
enum kCFCoreFoundationVersionNumber10_4_8 = 368.27;
enum kCFCoreFoundationVersionNumber10_4_9 = 368.28;
enum kCFCoreFoundationVersionNumber10_4_10 = 368.28;
enum kCFCoreFoundationVersionNumber10_4_11 = 368.31;


alias uint CFTypeID;
alias uint CFOptionFlags;
alias uint CFHashCode;
alias int CFIndex;

alias const(void)* CFTypeRef;

alias void __CFString;
alias const(__CFString)* CFStringRef;
alias __CFString* CFMutableStringRef;

alias CFTypeRef CFPropertyListRef;

enum {
    kCFCompareLessThan = -1,
    kCFCompareEqualTo = 0,
    kCFCompareGreaterThan = 1
}
alias CFIndex CFComparisonResult;

alias extern(C) CFComparisonResult function(const(void)*val1, const(void)*val2, void* context) CFComparatorFunction;

enum {
    kCFNotFound = -1
}

struct CFRange
{
    CFIndex location;
    CFIndex length;
}

CFRange CFRangeMake(CFIndex loc, CFIndex len)
{
    CFRange range;
    range.location = loc;
    range.length = len;
    return range;
}

alias void __CFNull;
alias const(__CFNull)* CFNullRef;

extern(C) CFTypeID CFNullGetTypeID();

extern(C) extern CFNullRef kCFNull; // the singleton null instance

alias void __CFAllocator;
alias const(__CFAllocator)* CFAllocatorRef;

extern(C) extern const CFAllocatorRef kCFAllocatorDefault;
extern(C) extern const CFAllocatorRef kCFAllocatorSystemDefault;
extern(C) extern const CFAllocatorRef kCFAllocatorMalloc;
extern(C) extern const CFAllocatorRef kCFAllocatorMallocZone;
extern(C) extern const CFAllocatorRef kCFAllocatorNull;
extern(C) extern const CFAllocatorRef kCFAllocatorUseContext;

alias extern(C) const(void)* function(const(void)* info) CFAllocatorRetainCallBack;
alias extern(C) void function(const(void)* info) CFAllocatorReleaseCallBack;
alias extern(C) CFStringRef function(const(void)* info) CFAllocatorCopyDescriptionCallBack;
alias extern(C) void* function(CFIndex allocSize, CFOptionFlags hint, void* info) CFAllocatorAllocateCallBack;
alias extern(C) void* function(void* ptr, CFIndex newsize, CFOptionFlags hint, void* info) CFAllocatorReallocateCallBack;
alias extern(C) void function(void* ptr, void* info) CFAllocatorDeallocateCallBack;
alias extern(C) CFIndex function(CFIndex size, CFOptionFlags hint, void* info) CFAllocatorPreferredSizeCallBack;

struct  CFAllocatorContext
{
    CFIndex    _version;
    void*    info;
    CFAllocatorRetainCallBack  retain;
    CFAllocatorReleaseCallBack  release;
    CFAllocatorCopyDescriptionCallBack copyDescription;
    CFAllocatorAllocateCallBack  allocate;
    CFAllocatorReallocateCallBack reallocate;
    CFAllocatorDeallocateCallBack deallocate;
    CFAllocatorPreferredSizeCallBack preferredSize;
}

extern(C) CFTypeID CFAllocatorGetTypeID();

extern(C) void CFAllocatorSetDefault(CFAllocatorRef allocator);

extern(C) CFAllocatorRef CFAllocatorGetDefault();

extern(C) CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext* context);

extern(C) void* CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint);

extern(C) void* CFAllocatorReallocate(CFAllocatorRef allocator, void* ptr, CFIndex newsize, CFOptionFlags hint);

extern(C) void CFAllocatorDeallocate(CFAllocatorRef allocator, void* ptr);

extern(C) CFIndex CFAllocatorGetPreferredSizeForSize(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint);

extern(C) void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext* context);

extern(C) CFTypeID CFGetTypeID(CFTypeRef cf);

extern(C) CFStringRef CFCopyTypeIDDescription(CFTypeID type_id);

extern(C) CFTypeRef CFRetain(CFTypeRef cf);

extern(C) void CFRelease(CFTypeRef cf);

extern(C) CFIndex CFGetRetainCount(CFTypeRef cf);

extern(C) CFTypeRef CFMakeCollectable(CFTypeRef cf);

extern(C) Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2);

extern(C) CFHashCode CFHash(CFTypeRef cf);

extern(C) CFStringRef CFCopyDescription(CFTypeRef cf);

extern(C) CFAllocatorRef CFGetAllocator(CFTypeRef cf);
