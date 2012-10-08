/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/


// Apple's Original License
/*
 * Copyright (c) 2005 Apple Computer, Inc. All rights reserved.
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
/*	CFXMLNode.h
	Copyright (c) 1998-2005, Apple, Inc. All rights reserved.
*/

module CoreFoundation.CFXMLNode;

import CoreFoundation.CFBase;
import CoreFoundation.CFArray;
import CoreFoundation.CFDictionary;
import CoreFoundation.CFString;
import CoreFoundation.CFTree;
import CoreFoundation.CFURL;

extern(C):

enum {
	kCFXMLNodeCurrentVersion = 1
};

alias void __CFXMLNode;
alias const(__CFXMLNode)* CFXMLNodeRef;
alias CFTreeRef CFXMLTreeRef;

enum  CFXMLNodeTypeCode {
    kCFXMLNodeTypeDocument = 1,
    kCFXMLNodeTypeElement = 2,
    kCFXMLNodeTypeAttribute = 3,
    kCFXMLNodeTypeProcessingInstruction = 4,
    kCFXMLNodeTypeComment = 5,
    kCFXMLNodeTypeText = 6,
    kCFXMLNodeTypeCDATASection = 7,
    kCFXMLNodeTypeDocumentFragment = 8,
    kCFXMLNodeTypeEntity = 9,
    kCFXMLNodeTypeEntityReference = 10,
    kCFXMLNodeTypeDocumentType = 11,
    kCFXMLNodeTypeWhitespace = 12,
    kCFXMLNodeTypeNotation = 13,
    kCFXMLNodeTypeElementTypeDeclaration = 14,
    kCFXMLNodeTypeAttributeListDeclaration = 15
}

struct  CFXMLElementInfo {
    CFDictionaryRef attributes;
    CFArrayRef attributeOrder;
    Boolean isEmpty;
    char[3] _reserved;
}

struct  CFXMLProcessingInstructionInfo {
    CFStringRef dataString;
}

struct  CFXMLDocumentInfo {
    CFURLRef sourceURL;
    CFStringEncoding encoding;
}

struct  CFXMLExternalID {
    CFURLRef systemID;
    CFStringRef publicID;
}

struct CFXMLDocumentTypeInfo {
    CFXMLExternalID externalID;
}

struct CFXMLNotationInfo {
    CFXMLExternalID externalID;
}

struct CFXMLElementTypeDeclarationInfo {
    /* This is expected to change in future versions */
    CFStringRef contentDescription;
}

struct CFXMLAttributeDeclarationInfo {
    /* This is expected to change in future versions */
    CFStringRef attributeName;
    CFStringRef typeString;
    CFStringRef defaultString;
}

struct CFXMLAttributeListDeclarationInfo{
    CFIndex numberOfAttributes;
    CFXMLAttributeDeclarationInfo *attributes;
}

enum CFXMLEntityTypeCode {
    kCFXMLEntityTypeParameter,       /* Implies parsed, internal */
    kCFXMLEntityTypeParsedInternal,
    kCFXMLEntityTypeParsedExternal,
    kCFXMLEntityTypeUnparsed,
    kCFXMLEntityTypeCharacter
}

struct CFXMLEntityInfo{
    CFXMLEntityTypeCode entityType;
    CFStringRef replacementText;     /* NULL if entityType is external or unparsed */
    CFXMLExternalID entityID;          /* entityID.systemID will be NULL if entityType is internal */
    CFStringRef notationName;        /* NULL if entityType is parsed */
}

struct CFXMLEntityReferenceInfo{
    CFXMLEntityTypeCode entityType;
}


extern(C) CFTypeID CFXMLNodeGetTypeID();

extern(C) CFXMLNodeRef CFXMLNodeCreate(CFAllocatorRef alloc, CFXMLNodeTypeCode xmlType, CFStringRef dataString, const(void)* additionalInfoPtr, CFIndex ver );

extern(C) CFXMLNodeRef CFXMLNodeCreateCopy(CFAllocatorRef alloc, CFXMLNodeRef origNode);

extern(C) CFXMLNodeTypeCode CFXMLNodeGetTypeCode(CFXMLNodeRef node);

extern(C) CFStringRef CFXMLNodeGetString(CFXMLNodeRef node);

extern(C) const(void)* CFXMLNodeGetInfoPtr(CFXMLNodeRef node);

extern(C) CFIndex CFXMLNodeGetVersion(CFXMLNodeRef node);

extern(C) CFXMLTreeRef CFXMLTreeCreateWithNode(CFAllocatorRef allocator, CFXMLNodeRef node);

extern(C) CFXMLNodeRef CFXMLTreeGetNode(CFXMLTreeRef xmlTree);

