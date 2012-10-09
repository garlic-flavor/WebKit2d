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

/*	CFBitVector.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/
module CoreFoundation.CFBitVector;

import CoreFoundation.CFBase;

extern(C):

alias UInt32 CFBit;

alias void __CFBitVector;
alias const(__CFBitVector)* CFBitVectorRef;
alias __CFBitVector* CFMutableBitVectorRef;

CFTypeID CFBitVectorGetTypeID();

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const(UInt8)* bytes, CFIndex numBits);
CFBitVectorRef CFBitVectorCreateCopy(CFAllocatorRef allocator, CFBitVectorRef bv);
CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity);
CFMutableBitVectorRef CFBitVectorCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBitVectorRef bv);

CFIndex CFBitVectorGetCount(CFBitVectorRef bv);
CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value);
Boolean CFBitVectorContainsBit(CFBitVectorRef bv, CFRange range, CFBit value);
CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx);
void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8* bytes);
CFIndex CFBitVectorGetFirstIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value);
CFIndex CFBitVectorGetLastIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value);

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count);
void CFBitVectorFlipBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx);
void CFBitVectorFlipBits(CFMutableBitVectorRef bv, CFRange range);
void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value);
void CFBitVectorSetBits(CFMutableBitVectorRef bv, CFRange range, CFBit value);
void CFBitVectorSetAllBits(CFMutableBitVectorRef bv, CFBit value);

