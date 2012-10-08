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
/*	CFPlugIn.h
	Copyright (c) 1999-2007, Apple Inc.  All rights reserved.
*/

module CoreFoundation.CFPlugIn;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFBundle;
import CoreFoundation.CFString;
import CoreFoundation.CFURL;
import CoreFoundation.CFUUID;

extern(C):

extern(C) extern const CFStringRef kCFPlugInDynamicRegistrationKey;
extern(C) extern const CFStringRef kCFPlugInDynamicRegisterFunctionKey;
extern(C) extern const CFStringRef kCFPlugInUnloadFunctionKey;
extern(C) extern const CFStringRef kCFPlugInFactoriesKey;
extern(C) extern const CFStringRef kCFPlugInTypesKey;

alias extern(C) void function(CFPlugInRef plugIn) CFPlugInDynamicRegisterFunction;
alias extern(C) void function(CFPlugInRef plugIn) CFPlugInUnloadFunction;
alias extern(C) void *function(CFAllocatorRef allocator, CFUUIDRef typeUUID) CFPlugInFactoryFunction;

extern(C) CFTypeID CFPlugInGetTypeID();

extern(C) CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL);

extern(C) CFBundleRef CFPlugInGetBundle(CFPlugInRef plugIn);

extern(C) void CFPlugInSetLoadOnDemand(CFPlugInRef plugIn, Boolean flag);

extern(C) Boolean CFPlugInIsLoadOnDemand(CFPlugInRef plugIn);

extern(C) CFArrayRef CFPlugInFindFactoriesForPlugInType(CFUUIDRef typeUUID);

extern(C) CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn);


extern(C) void* CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID);

extern(C) Boolean CFPlugInRegisterFactoryFunction(CFUUIDRef factoryUUID, CFPlugInFactoryFunction func);

extern(C) Boolean CFPlugInRegisterFactoryFunctionByName(CFUUIDRef factoryUUID, CFPlugInRef plugIn, CFStringRef functionName);

extern(C) Boolean CFPlugInUnregisterFactory(CFUUIDRef factoryUUID);

extern(C) Boolean CFPlugInRegisterPlugInType(CFUUIDRef factoryUUID, CFUUIDRef typeUUID);

extern(C) Boolean CFPlugInUnregisterPlugInType(CFUUIDRef factoryUUID, CFUUIDRef typeUUID);

extern(C) void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID);

extern(C) void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID);


/* Obsolete API */

alias void __CFPlugInInstance;
alias __CFPlugInInstance* CFPlugInInstanceRef;

alias extern(C) Boolean function(CFPlugInInstanceRef instance, CFStringRef interfaceName, void** ftbl) CFPlugInInstanceGetInterfaceFunction;
alias extern(C) void function(void* instanceData) CFPlugInInstanceDeallocateInstanceDataFunction;

extern(C) Boolean CFPlugInInstanceGetInterfaceFunctionTable(CFPlugInInstanceRef instance, CFStringRef interfaceName, void** ftbl);
extern(C) CFStringRef CFPlugInInstanceGetFactoryName(CFPlugInInstanceRef instance);
extern(C) void* CFPlugInInstanceGetInstanceData(CFPlugInInstanceRef instance);
extern(C) CFTypeID CFPlugInInstanceGetTypeID();
extern(C) CFPlugInInstanceRef CFPlugInInstanceCreateWithInstanceDataSize(CFAllocatorRef allocator, CFIndex instanceDataSize, CFPlugInInstanceDeallocateInstanceDataFunction deallocateInstanceFunction, CFStringRef factoryName, CFPlugInInstanceGetInterfaceFunction getInterfaceFunction);

