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
/*	CFBundle.h
	Copyright (c) 1999-2009, Apple Inc.  All rights reserved.
*/

module CoreFoundation.CFBundle;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFDictionary;
import CoreFoundation.CFError;
import CoreFoundation.CFString;
import CoreFoundation.CFURL;

extern(C):

alias void __CFBundle;
alias __CFBundle* CFBundleRef;
alias __CFBundle* CFPlugInRef;

extern(C) extern const CFStringRef kCFBundleInfoDictionaryVersionKey;
extern(C) extern const CFStringRef kCFBundleExecutableKey;
extern(C) extern const CFStringRef kCFBundleIdentifierKey;
extern(C) extern const CFStringRef kCFBundleVersionKey;
extern(C) extern const CFStringRef kCFBundleDevelopmentRegionKey;
extern(C) extern const CFStringRef kCFBundleNameKey;
extern(C) extern const CFStringRef kCFBundleLocalizationsKey;
extern(C) CFBundleRef CFBundleGetMainBundle();

extern(C) CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID);
extern(C) CFArrayRef CFBundleGetAllBundles();
extern(C) CFTypeID CFBundleGetTypeID();

extern(C) CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL);
extern(C) CFArrayRef CFBundleCreateBundlesFromDirectory(CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType);
extern(C) CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle);

extern(C) CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key);
extern(C) CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle);
extern(C) CFDictionaryRef CFBundleGetLocalInfoDictionary(CFBundleRef bundle);
extern(C) void CFBundleGetPackageInfo(CFBundleRef bundle, UInt32* packageType, UInt32* packageCreator);

extern(C) CFStringRef CFBundleGetIdentifier(CFBundleRef bundle);

extern(C) UInt32 CFBundleGetVersionNumber(CFBundleRef bundle);

extern(C) CFStringRef CFBundleGetDevelopmentRegion(CFBundleRef bundle);

extern(C) CFURLRef CFBundleCopySupportFilesDirectoryURL(CFBundleRef bundle);

extern(C) CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle);

extern(C) CFURLRef CFBundleCopyPrivateFrameworksURL(CFBundleRef bundle);

extern(C) CFURLRef CFBundleCopySharedFrameworksURL(CFBundleRef bundle);

extern(C) CFURLRef CFBundleCopySharedSupportURL(CFBundleRef bundle);

extern(C) CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle);

extern(C) CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL);

extern(C) Boolean CFBundleGetPackageInfoInDirectory(CFURLRef url, UInt32 *packageType, UInt32* packageCreator);

extern(C) CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName);

extern(C) CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName);

extern(C) CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName);

auto CFCopyLocalizedString( CFStringRef key, CFStringRef comment){ return
            CFBundleCopyLocalizedString(CFBundleGetMainBundle(), (key), (key), NULL); }
auto CFCopyLocalizedStringFromTable( CFStringRef key, CFStringRef tbl, CFStringRef comment){ return
            CFBundleCopyLocalizedString(CFBundleGetMainBundle(), (key), (key), (tbl)); }
auto CFCopyLocalizedStringFromTableInBundle(CFStringRef key, CFStringRef tbl, CFBundleRef bundle, CFStringRef comment){ return
            CFBundleCopyLocalizedString((bundle), (key), (key), (tbl)); }
auto CFCopyLocalizedStringWithDefaultValue( CFStringRef key, CFStringRef tbl, CFBundleRef bundle, CFStringRef value, CFStringRef comment){ return
            CFBundleCopyLocalizedString((bundle), (key), (value), (tbl)); }

extern(C) CFURLRef CFBundleCopyResourceURLInDirectory(CFURLRef bundleURL, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName);

extern(C) CFArrayRef CFBundleCopyResourceURLsOfTypeInDirectory(CFURLRef bundleURL, CFStringRef resourceType, CFStringRef subDirName);

extern(C) CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle);
extern(C) CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray);
extern(C) CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray);

extern(C) CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName);

extern(C) CFArrayRef CFBundleCopyResourceURLsOfTypeForLocalization(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName);
extern(C) CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url);
extern(C) CFArrayRef CFBundleCopyLocalizationsForURL(CFURLRef url);
extern(C) CFArrayRef CFBundleCopyExecutableArchitecturesForURL(CFURLRef url);
extern(C) CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle);

enum {
    kCFBundleExecutableArchitectureI386     = 0x00000007,
    kCFBundleExecutableArchitecturePPC      = 0x00000012,
    kCFBundleExecutableArchitectureX86_64   = 0x01000007,
    kCFBundleExecutableArchitecturePPC64    = 0x01000012
};

extern(C) CFArrayRef CFBundleCopyExecutableArchitectures(CFBundleRef bundle);
extern(C) Boolean CFBundlePreflightExecutable(CFBundleRef bundle, CFErrorRef* error);
extern(C) Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef* error);
extern(C) Boolean CFBundleLoadExecutable(CFBundleRef bundle);

extern(C) Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle);

extern(C) void CFBundleUnloadExecutable(CFBundleRef bundle);

extern(C) void *CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName);

extern(C) void CFBundleGetFunctionPointersForNames(CFBundleRef bundle, CFArrayRef functionNames, void*[] ftbl);

extern(C) void* CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName);

extern(C) void CFBundleGetDataPointersForNames(CFBundleRef bundle, CFArrayRef symbolNames, void*[] stbl);

extern(C) CFURLRef CFBundleCopyAuxiliaryExecutableURL(CFBundleRef bundle, CFStringRef executableName);

extern(C) CFPlugInRef CFBundleGetPlugIn(CFBundleRef bundle);

version(D_LP64)
	alias int CFBundleRefNum;
else
	alias SInt16 CFBundleRefNum;

extern(C) CFBundleRefNum CFBundleOpenBundleResourceMap(CFBundleRef bundle);
extern(C) SInt32 CFBundleOpenBundleResourceFiles(CFBundleRef bundle, CFBundleRefNum* refNum, CFBundleRefNum *localizedRefNum);
extern(C) void CFBundleCloseBundleResourceMap(CFBundleRef bundle, CFBundleRefNum refNum);
