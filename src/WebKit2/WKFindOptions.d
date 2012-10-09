/**
 * Version:      0.0002(dmd2.060)
 * Date:         2012-Oct-10 01:47:01
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKFindOptions;

enum WKFindOptions
{
    CaseInsensitive = 1 << 0,
    AtWordStarts = 1 << 1,
    TreatMedialCapitalAsWordStart = 1 << 2,
    Backwards = 1 << 3,
    WrapAround = 1 << 4,
    ShowOverlay = 1 << 5,
    ShowFindIndicator = 1 << 6,
    ShowHighlight = 1 << 7
}
