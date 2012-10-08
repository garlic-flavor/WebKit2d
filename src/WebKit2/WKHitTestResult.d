/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKHitTestResult;

import WebKit2.WKBase;

extern(C):

WKTypeID WKHitTestResultGetTypeID();

WKURLRef WKHitTestResultCopyAbsoluteImageURL(WKHitTestResultRef hitTestResult);
WKURLRef WKHitTestResultCopyAbsolutePDFURL(WKHitTestResultRef hitTestResult);
WKURLRef WKHitTestResultCopyAbsoluteLinkURL(WKHitTestResultRef hitTestResult);
WKURLRef WKHitTestResultCopyAbsoluteMediaURL(WKHitTestResultRef hitTestResult);

WKStringRef WKHitTestResultCopyLinkLabel(WKHitTestResultRef hitTestResult);
WKStringRef WKHitTestResultCopyLinkTitle(WKHitTestResultRef hitTestResult);

bool WKHitTestResultIsContentEditable(WKHitTestResultRef hitTestResult);
