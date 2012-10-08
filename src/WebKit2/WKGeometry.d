/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKGeometry;

import WebKit2.WKBase;

struct WKPoint {
    double x;
    double y;

    bool opEquals( ref in WKPoint p ){ return this.x == p.x && this.y == p.y; }
}

WKPoint WKPointMake(double x, double y)
{
    WKPoint point;
    point.x = x;
    point.y = y;
    return point;
}

struct WKSize {
    double width;
    double height;
}

WKSize WKSizeMake(double width, double height)
{
    WKSize size;
    size.width = width;
    size.height = height;
    return size;
}

struct WKRect {
    WKPoint origin;
    WKSize size;
}

WKRect WKRectMake(double x, double y, double width, double height)
{
    WKRect rect;
    rect.origin.x = x;
    rect.origin.y = y;
    rect.size.width = width;
    rect.size.height = height;
    return rect;
}


alias extern(C) WKTypeID WKSizeGetTypeID();
alias extern(C) WKTypeID WKPointGetTypeID();
alias extern(C) WKTypeID WKRectGetTypeID();

alias extern(C) WKPointRef WKPointCreate(WKPoint point);
alias extern(C) WKSizeRef WKSizeCreate(WKSize size);
alias extern(C) WKRectRef WKRectCreate(WKRect rect);

alias extern(C) WKSize WKSizeGetValue(WKSizeRef size);
alias extern(C) WKPoint WKPointGetValue(WKPointRef point);
alias extern(C) WKRect WKRectGetValue(WKRectRef rect);


