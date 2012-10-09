/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKURLResponse;

import WebKit2.WKBase;

extern(C):

WKTypeID WKURLResponseGetTypeID();

WKURLRef WKURLResponseCopyURL(WKURLResponseRef);

WKStringRef WKURLResponseCopyMIMEType(WKURLResponseRef);

int WKURLResponseHTTPStatusCode(WKURLResponseRef);

WKStringRef WKURLResponseCopySuggestedFilename(WKURLResponseRef);

bool WKURLResponseIsAttachment(WKURLResponseRef);

