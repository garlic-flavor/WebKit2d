/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2012 Apple Inc. All rights reserved.
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

/*	CFTree.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/
/*!
        @header CFTree
        CFTree implements a container which stores references to other CFTrees.
        Each tree may have a parent, and a variable number of children.
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

CFTypeID CFTreeGetTypeID();

CFTreeRef CFTreeCreate(CFAllocatorRef allocator, const CFTreeContext* context);

CFTreeRef CFTreeGetParent(CFTreeRef tree);

CFTreeRef CFTreeGetNextSibling(CFTreeRef tree);

CFTreeRef CFTreeGetFirstChild(CFTreeRef tree);

void CFTreeGetContext(CFTreeRef tree, CFTreeContext* context);

CFIndex CFTreeGetChildCount(CFTreeRef tree);

CFTreeRef CFTreeGetChildAtIndex(CFTreeRef tree, CFIndex idx);

void CFTreeGetChildren(CFTreeRef tree, CFTreeRef* children);

void CFTreeApplyFunctionToChildren(CFTreeRef tree, CFTreeApplierFunction applier, void* context);

CFTreeRef CFTreeFindRoot(CFTreeRef tree);

void CFTreeSetContext(CFTreeRef tree, const(CFTreeContext)* context);

void CFTreePrependChild(CFTreeRef tree, CFTreeRef newChild);

void CFTreeAppendChild(CFTreeRef tree, CFTreeRef newChild);

void CFTreeInsertSibling(CFTreeRef tree, CFTreeRef newSibling);

void CFTreeRemove(CFTreeRef tree);

void CFTreeRemoveAllChildren(CFTreeRef tree);

void CFTreeSortChildren(CFTreeRef tree, CFComparatorFunction comparator, void* context);

