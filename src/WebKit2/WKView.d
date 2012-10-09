/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKView;

import win32.windows;
import WebKit2.WKBase;
import WebKit2.WKGeometry;

extern(C):

struct IDropTarget{ }

// Undo Client.
enum {
    kWKViewUndo = 0,
    kWKViewRedo = 1
}
alias uint WKViewUndoType;

alias extern(C) void function(WKViewRef, WKEditCommandRef, WKViewUndoType undoOrRedo, const void *clientInfo) WKViewRegisterEditCommandCallback;
alias extern(C) void function(WKViewRef, const void *clientInfo) WKViewClearAllEditCommandsCallback;
alias extern(C) bool function(WKViewRef, WKViewUndoType undoOrRedo, const void *clientInfo) WKViewCanUndoRedoCallback;
alias extern(C) void function(WKViewRef, WKViewUndoType undoOrRedo, const void *clientInfo) WKViewExecuteUndoRedoCallback;

struct WKViewUndoClient {
    int                                                                 _version;
    const void *                                                        clientInfo;
    WKViewRegisterEditCommandCallback                                   registerEditCommand;
    WKViewClearAllEditCommandsCallback                                  clearAllEditCommands;
    WKViewCanUndoRedoCallback                                           canUndoRedo;
    WKViewExecuteUndoRedoCallback                                       executeUndoRedo;
};

enum kWKViewUndoClientCurrentVersion = 0;

WKTypeID WKViewGetTypeID();

WKViewRef WKViewCreate(RECT rect, WKContextRef context, WKPageGroupRef pageGroup, HWND parentWindow);

HWND WKViewGetWindow(WKViewRef view);

WKPageRef WKViewGetPage(WKViewRef view);

void WKViewSetViewUndoClient(WKViewRef view, const WKViewUndoClient* client);
void WKViewReapplyEditCommand(WKViewRef view, WKEditCommandRef command);
void WKViewUnapplyEditCommand(WKViewRef view, WKEditCommandRef command);

void WKViewSetParentWindow(WKViewRef view, HWND parentWindow);
void WKViewWindowAncestryDidChange(WKViewRef view);
void WKViewSetIsInWindow(WKViewRef view, bool isInWindow);
void WKViewSetInitialFocus(WKViewRef view, bool forward);
void WKViewSetScrollOffsetOnNextResize(WKViewRef view, WKSize scrollOffset);

alias extern(C) void function(WKViewRef, HBITMAP selectionBitmap, RECT selectionRectInWindowCoordinates, bool fadeout, void*) WKViewFindIndicatorCallback;
void WKViewSetFindIndicatorCallback(WKViewRef view, WKViewFindIndicatorCallback callback, void* context);

WKViewFindIndicatorCallback WKViewGetFindIndicatorCallback(WKViewRef view, void** context);

bool WKViewIsPageOverlayInstalled(WKViewRef view);

void WKViewSetDrawsTransparentBackground(WKViewRef view, bool drawsTransparentBackground);
bool WKViewDrawsTransparentBackground(WKViewRef view);

void WKViewSetCustomDropTarget(WKViewRef view, IDropTarget*);


