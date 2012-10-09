/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKBackForwardList;

import WebKit2.WKBase;

extern(C):

WKTypeID WKBackForwardListGetTypeID();

WKBackForwardListItemRef WKBackForwardListGetCurrentItem(WKBackForwardListRef list);
WKBackForwardListItemRef WKBackForwardListGetBackItem(WKBackForwardListRef list);
WKBackForwardListItemRef WKBackForwardListGetForwardItem(WKBackForwardListRef list);
WKBackForwardListItemRef WKBackForwardListGetItemAtIndex(WKBackForwardListRef list, int index);

uint WKBackForwardListGetBackListCount(WKBackForwardListRef list);
uint WKBackForwardListGetForwardListCount(WKBackForwardListRef list);

WKArrayRef WKBackForwardListCopyBackListWithLimit(WKBackForwardListRef list, uint limit);
WKArrayRef WKBackForwardListCopyForwardListWithLimit(WKBackForwardListRef list, uint limit);
