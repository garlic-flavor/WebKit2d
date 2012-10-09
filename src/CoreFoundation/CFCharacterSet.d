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

/*	CFCharacterSet.h
	Copyright (c) 1999-2012, Apple Inc. All rights reserved.
*/

module CoreFoundation.CFCharacterSet;

import CoreFoundation.CFBase;
import CoreFoundation.CFData;

extern(C):

alias void __CFCharacterSet;
alias const(__CFCharacterSet)* CFCharacterSetRef;

alias __CFCharacterSet* CFMutableCharacterSetRef;

enum {
    kCFCharacterSetControl = 1, /* Control character set (Unicode General Category Cc and Cf) */
    kCFCharacterSetWhitespace, /* Whitespace character set (Unicode General Category Zs and U0009 CHARACTER TABULATION) */
    kCFCharacterSetWhitespaceAndNewline,  /* Whitespace and Newline character set (Unicode General Category Z*, U000A ~ U000D, and U0085) */
    kCFCharacterSetDecimalDigit, /* Decimal digit character set */
    kCFCharacterSetLetter, /* Letter character set (Unicode General Category L* & M*) */
    kCFCharacterSetLowercaseLetter, /* Lowercase character set (Unicode General Category Ll) */
    kCFCharacterSetUppercaseLetter, /* Uppercase character set (Unicode General Category Lu and Lt) */
    kCFCharacterSetNonBase, /* Non-base character set (Unicode General Category M*) */
    kCFCharacterSetDecomposable, /* Canonically decomposable character set */
    kCFCharacterSetAlphaNumeric, /* Alpha Numeric character set (Unicode General Category L*, M*, & N*) */
    kCFCharacterSetPunctuation, /* Punctuation character set (Unicode General Category P*) */
    kCFCharacterSetCapitalizedLetter = 13, /* Titlecase character set (Unicode General Category Lt) */
    kCFCharacterSetSymbol = 14, /* Symbol character set (Unicode General Category S*) */
    kCFCharacterSetNewline = 15, /* Newline character set (U000A ~ U000D, U0085, U2028, and U2029) */
    kCFCharacterSetIllegal = 12/* Illegal character set */
};
alias CFIndex CFCharacterSetPredefinedSet;

CFTypeID CFCharacterSetGetTypeID();

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier);

CFCharacterSetRef CFCharacterSetCreateWithCharactersInRange(CFAllocatorRef alloc, CFRange theRange);

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString);

CFCharacterSetRef CFCharacterSetCreateWithBitmapRepresentation(CFAllocatorRef alloc, CFDataRef theData);

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet);

Boolean CFCharacterSetIsSupersetOfSet(CFCharacterSetRef theSet, CFCharacterSetRef theOtherset);

Boolean CFCharacterSetHasMemberInPlane(CFCharacterSetRef theSet, CFIndex thePlane);

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc);

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet);

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet);

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar);

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar);

CFDataRef CFCharacterSetCreateBitmapRepresentation(CFAllocatorRef alloc, CFCharacterSetRef theSet);

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange);

void CFCharacterSetRemoveCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange);

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet,  CFStringRef theString);

void CFCharacterSetRemoveCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString);

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet);

void CFCharacterSetIntersect(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet);

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet);

