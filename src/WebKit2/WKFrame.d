/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKFrame;

import WebKit2.WKBase;

extern(C):

enum
{
    kWKFrameLoadStateProvisional = 0,
    kWKFrameLoadStateCommitted = 1,
    kWKFrameLoadStateFinished = 2
}
alias uint WKFrameLoadState;

WKTypeID WKFrameGetTypeID();

bool WKFrameIsMainFrame(WKFrameRef frame);
WKFrameLoadState WKFrameGetFrameLoadState(WKFrameRef frame);
WKURLRef WKFrameCopyProvisionalURL(WKFrameRef frame);
WKURLRef WKFrameCopyURL(WKFrameRef frame);
WKURLRef WKFrameCopyUnreachableURL(WKFrameRef frame);

void WKFrameStopLoading(WKFrameRef frame);

WKStringRef WKFrameCopyMIMEType(WKFrameRef frame);
WKStringRef WKFrameCopyTitle(WKFrameRef frame);

WKPageRef WKFrameGetPage(WKFrameRef frame);

WKArrayRef WKFrameCopyChildFrames(WKFrameRef frame);

WKFrameRef WKFrameGetParentFrame(WKFrameRef frame);

WKCertificateInfoRef WKFrameGetCertificateInfo(WKFrameRef frame);

bool WKFrameCanProvideSource(WKFrameRef frame);
bool WKFrameCanShowMIMEType(WKFrameRef frame, WKStringRef mimeType);

bool WKFrameIsDisplayingStandaloneImageDocument(WKFrameRef frame);
bool WKFrameIsDisplayingMarkupDocument(WKFrameRef frame);

bool WKFrameIsFrameSet(WKFrameRef frame);

alias extern(C) void function(WKDataRef data, WKErrorRef error, void* functionContext) WKFrameGetResourceDataFunction;
void WKFrameGetMainResourceData(WKFrameRef frame, WKFrameGetResourceDataFunction func, void* functionContext);
void WKFrameGetResourceData(WKFrameRef frame, WKURLRef resourceURL, WKFrameGetResourceDataFunction func, void* functionContext);

version(__BLOCKS__)
{
	alias extern(C) void function(WKDataRef data, WKErrorRef error) WKFrameGetResourceDataBlock;
	void WKFrameGetMainResourceData_b(WKFrameRef frame, WKFrameGetResourceDataBlock block);
	void WKFrameGetResourceData_b(WKFrameRef frame, WKURLRef resourceURL, WKFrameGetResourceDataBlock block);
}
alias extern(C) void function(WKDataRef archiveData, WKErrorRef error, void* functionContext) WKFrameGetWebArchiveFunction;
void WKFrameGetWebArchive(WKFrameRef frame, WKFrameGetWebArchiveFunction func, void* functionContext);

version(__BLOCKS__)
{
	alias extern(C) void function(WKDataRef archiveData, WKErrorRef error) WKFrameGetWebArchiveBlock;
	void WKFrameGetWebArchive_b(WKFrameRef frame, WKFrameGetWebArchiveBlock block);
}

