/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKEvent;

import WebKit2.WKBase;


enum WKEventModifiers {
    ShiftKey = 1 << 0,
    ControlKey = 1 << 1,
    AltKey = 1 << 2,
    MetaKey = 1 << 3
}

enum WKEventMouseButton
{
    NoButton = -1,
    LeftButton = 0,
    MiddleButton = 1,
    RightButton = 2,
};