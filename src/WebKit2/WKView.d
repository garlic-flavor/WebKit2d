/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
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
enum WKViewUndoType{
    kWKViewUndo = 0,
    kWKViewRedo = 1
};

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

extern(C) WKTypeID WKViewGetTypeID();

extern(C) WKViewRef WKViewCreate(RECT rect, WKContextRef context, WKPageGroupRef pageGroup, HWND parentWindow);

extern(C) HWND WKViewGetWindow(WKViewRef view);

extern(C) WKPageRef WKViewGetPage(WKViewRef view);

extern(C) void WKViewSetViewUndoClient(WKViewRef view, const WKViewUndoClient* client);
extern(C) void WKViewReapplyEditCommand(WKViewRef view, WKEditCommandRef command);
extern(C) void WKViewUnapplyEditCommand(WKViewRef view, WKEditCommandRef command);

extern(C) void WKViewSetParentWindow(WKViewRef view, HWND parentWindow);
extern(C) void WKViewWindowAncestryDidChange(WKViewRef view);
extern(C) void WKViewSetIsInWindow(WKViewRef view, bool isInWindow);
extern(C) void WKViewSetInitialFocus(WKViewRef view, bool forward);
extern(C) void WKViewSetScrollOffsetOnNextResize(WKViewRef view, WKSize scrollOffset);

alias extern(C) void function(WKViewRef, HBITMAP selectionBitmap, RECT selectionRectInWindowCoordinates, bool fadeout, void*) WKViewFindIndicatorCallback;

extern(C) void WKViewSetFindIndicatorCallback(WKViewRef view, WKViewFindIndicatorCallback callback, void* context);
extern(C) WKViewFindIndicatorCallback WKViewGetFindIndicatorCallback(WKViewRef view, void** context);

extern(C) bool WKViewIsPageOverlayInstalled(WKViewRef view);

extern(C) void WKViewSetDrawsTransparentBackground(WKViewRef view, bool drawsTransparentBackground);
extern(C) bool WKViewDrawsTransparentBackground(WKViewRef view);

extern(C) void WKViewSetCustomDropTarget(WKViewRef view, IDropTarget*);


