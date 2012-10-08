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
/*	CFXMLParser.h
	Copyright (c) 1998-2009, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFXMLParser;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFData;
import CoreFoundation.CFDictionary;
import CoreFoundation.CFTree;
import CoreFoundation.CFURL;
import CoreFoundation.CFXMLNode;

extern(C):

alias void __CFXMLParser;
alias __CFXMLParser* CFXMLParserRef;


enum {
    kCFXMLParserValidateDocument = (1UL << 0),
    kCFXMLParserSkipMetaData = (1UL << 1),
    kCFXMLParserReplacePhysicalEntities = (1UL << 2),
    kCFXMLParserSkipWhitespace = (1UL << 3),
    kCFXMLParserResolveExternalEntities = (1UL << 4),
    kCFXMLParserAddImpliedAttributes = (1UL << 5),
    kCFXMLParserAllOptions = 0x00FFFFFF,
    kCFXMLParserNoOptions = 0
}
alias CFOptionFlags CFXMLParserOptions;

enum {
    kCFXMLStatusParseNotBegun = -2,
    kCFXMLStatusParseInProgress = -1,
    kCFXMLStatusParseSuccessful = 0,
    kCFXMLErrorUnexpectedEOF = 1,
    kCFXMLErrorUnknownEncoding,
    kCFXMLErrorEncodingConversionFailure,
    kCFXMLErrorMalformedProcessingInstruction,
    kCFXMLErrorMalformedDTD,
    kCFXMLErrorMalformedName,
    kCFXMLErrorMalformedCDSect,
    kCFXMLErrorMalformedCloseTag,
    kCFXMLErrorMalformedStartTag,
    kCFXMLErrorMalformedDocument,
    kCFXMLErrorElementlessDocument,
    kCFXMLErrorMalformedComment,
    kCFXMLErrorMalformedCharacterReference,
    kCFXMLErrorMalformedParsedCharacterData,
    kCFXMLErrorNoData
}
alias CFIndex CFXMLParserStatusCode;


alias extern(C) void* function(CFXMLParserRef parser, CFXMLNodeRef nodeDesc, void* info) CFXMLParserCreateXMLStructureCallBack;
alias extern(C) void function(CFXMLParserRef parser, void* parent, void* child, void* info) CFXMLParserAddChildCallBack;
alias extern(C) void function(CFXMLParserRef parser, void* xmlType, void* info) CFXMLParserEndXMLStructureCallBack;
alias extern(C) CFDataRef function(CFXMLParserRef parser, CFXMLExternalID* extID, void* info) CFXMLParserResolveExternalEntityCallBack;
alias extern(C) Boolean function(CFXMLParserRef parser, CFXMLParserStatusCode error, void* info) CFXMLParserHandleErrorCallBack;

struct  CFXMLParserCallBacks {
    CFIndex                                  _version;
    CFXMLParserCreateXMLStructureCallBack    createXMLStructure;
    CFXMLParserAddChildCallBack              addChild;
    CFXMLParserEndXMLStructureCallBack       endXMLStructure;
    CFXMLParserResolveExternalEntityCallBack resolveExternalEntity;
    CFXMLParserHandleErrorCallBack           handleError;
}

alias extern(C) const(void)* function(const(void)* info) CFXMLParserRetainCallBack;
alias extern(C) void function(const(void)* info) CFXMLParserReleaseCallBack;
alias extern(C) CFStringRef function(const(void)* info) CFXMLParserCopyDescriptionCallBack;

struct  CFXMLParserContext{
    CFIndex				_version;
    void* 				info;
    CFXMLParserRetainCallBack		retain;
    CFXMLParserReleaseCallBack		release;
    CFXMLParserCopyDescriptionCallBack	copyDescription;
}

extern(C) CFTypeID CFXMLParserGetTypeID();

extern(C) CFXMLParserRef CFXMLParserCreate(CFAllocatorRef allocator, CFDataRef xmlData, CFURLRef dataSource, CFOptionFlags parseOptions, CFIndex versionOfNodes, CFXMLParserCallBacks* callBacks, CFXMLParserContext* context);

extern(C) CFXMLParserRef CFXMLParserCreateWithDataFromURL(CFAllocatorRef allocator, CFURLRef dataSource, CFOptionFlags parseOptions, CFIndex versionOfNodes, CFXMLParserCallBacks* callBacks, CFXMLParserContext* context);

extern(C) void CFXMLParserGetContext(CFXMLParserRef parser, CFXMLParserContext* context);

extern(C) void CFXMLParserGetCallBacks(CFXMLParserRef parser, CFXMLParserCallBacks* callBacks);

extern(C) CFURLRef CFXMLParserGetSourceURL(CFXMLParserRef parser);

extern(C) CFIndex CFXMLParserGetLocation(CFXMLParserRef parser);

extern(C) CFIndex CFXMLParserGetLineNumber(CFXMLParserRef parser);

extern(C) void* CFXMLParserGetDocument(CFXMLParserRef parser);

extern(C) CFXMLParserStatusCode CFXMLParserGetStatusCode(CFXMLParserRef parser);

extern(C) CFStringRef CFXMLParserCopyErrorDescription(CFXMLParserRef parser);

extern(C) void CFXMLParserAbort(CFXMLParserRef parser, CFXMLParserStatusCode errorCode, CFStringRef errorDescription);

extern(C) Boolean CFXMLParserParse(CFXMLParserRef parser);

extern(C) CFXMLTreeRef CFXMLTreeCreateFromData(CFAllocatorRef allocator, CFDataRef xmlData, CFURLRef dataSource, CFOptionFlags parseOptions, CFIndex versionOfNodes);

extern(C) CFXMLTreeRef CFXMLTreeCreateFromDataWithError(CFAllocatorRef allocator, CFDataRef xmlData, CFURLRef dataSource, CFOptionFlags parseOptions, CFIndex versionOfNodes, CFDictionaryRef* errorDict);

extern(C) CFXMLTreeRef CFXMLTreeCreateWithDataFromURL(CFAllocatorRef allocator, CFURLRef dataSource, CFOptionFlags parseOptions, CFIndex versionOfNodes);

extern(C) CFDataRef CFXMLTreeCreateXMLData(CFAllocatorRef allocator, CFXMLTreeRef xmlTree);

extern(C) CFStringRef CFXMLCreateStringByEscapingEntities(CFAllocatorRef allocator, CFStringRef string, CFDictionaryRef entitiesDictionary);

extern(C) CFStringRef CFXMLCreateStringByUnescapingEntities(CFAllocatorRef allocator, CFStringRef string, CFDictionaryRef entitiesDictionary);

extern(C) extern const CFStringRef kCFXMLTreeErrorDescription;

extern(C) extern const CFStringRef kCFXMLTreeErrorLineNumber;

extern(C) extern const CFStringRef kCFXMLTreeErrorLocation;

extern(C) extern const CFStringRef kCFXMLTreeErrorStatusCode;
