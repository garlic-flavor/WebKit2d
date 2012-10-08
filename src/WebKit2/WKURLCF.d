/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKURLCF;

import WebKit2.WKBase;
public import CoreFoundation.CoreFoundation;

struct __CFURL{ }
alias const(__CFURL)* CFURLRef;
struct __CFAllocator;
alias const(__CFAllocator)* CFAllocatorRef;

extern(C) WKURLRef WKURLCreateWithCFURL(CFURLRef URL);
extern(C) CFURLRef WKURLCopyCFURL(CFAllocatorRef alloc, WKURLRef URL);