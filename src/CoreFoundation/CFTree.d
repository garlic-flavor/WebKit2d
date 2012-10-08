/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2003 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * Copyright (c) 1999-2003 Apple Computer, Inc.  All Rights Reserved.
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
/*	CFTree.h
	Copyright (c) 1998-2003, Apple, Inc. All rights reserved.
*/
module CoreFoundation.CFTree;

import CoreFoundation.CFBase;

extern(C):

alias extern(C) const(void)* 	function(const(void)* info) CFTreeRetainCallBack;

alias extern(C) void		function(const(void)* info) CFTreeReleaseCallBack;

alias extern(C) CFStringRef	function(const(void)* info) CFTreeCopyDescriptionCallBack;

struct CFTreeContext {
    CFIndex				_version;
    void*				info;
    CFTreeRetainCallBack		retain;
    CFTreeReleaseCallBack		release;	
    CFTreeCopyDescriptionCallBack	copyDescription;
}

alias extern(C) void function(const(void)* value, void* context) CFTreeApplierFunction;

alias void __CFTree;
alias __CFTree* CFTreeRef;

extern(C) CFTypeID CFTreeGetTypeID();

extern(C) CFTreeRef CFTreeCreate(CFAllocatorRef allocator, const CFTreeContext* context);

extern(C) CFTreeRef CFTreeGetParent(CFTreeRef tree);

extern(C) CFTreeRef CFTreeGetNextSibling(CFTreeRef tree);

extern(C) CFTreeRef CFTreeGetFirstChild(CFTreeRef tree);

extern(C) void CFTreeGetContext(CFTreeRef tree, CFTreeContext* context);

extern(C) CFIndex CFTreeGetChildCount(CFTreeRef tree);

extern(C) CFTreeRef CFTreeGetChildAtIndex(CFTreeRef tree, CFIndex idx);

extern(C) void CFTreeGetChildren(CFTreeRef tree, CFTreeRef* children);

extern(C) void CFTreeApplyFunctionToChildren(CFTreeRef tree, CFTreeApplierFunction applier, void* context);

extern(C) CFTreeRef CFTreeFindRoot(CFTreeRef tree);

extern(C) void CFTreeSetContext(CFTreeRef tree, const(CFTreeContext)* context);

extern(C) void CFTreePrependChild(CFTreeRef tree, CFTreeRef newChild);

extern(C) void CFTreeAppendChild(CFTreeRef tree, CFTreeRef newChild);

extern(C) void CFTreeInsertSibling(CFTreeRef tree, CFTreeRef newSibling);

extern(C) void CFTreeRemove(CFTreeRef tree);

extern(C) void CFTreeRemoveAllChildren(CFTreeRef tree);

extern(C) void CFTreeSortChildren(CFTreeRef tree, CFComparatorFunction comparator, void* context);

