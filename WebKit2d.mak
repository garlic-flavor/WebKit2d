## MACRO
TARGET = lib\WebKit2d.lib
MAKE = make
MAKEFILE = WebKit2d.mak
TO_COMPILE = src\WebKit2\WKOpenPanelParameters.d src\WebKit2\WKMutableDictionary.d src\WebKit2\WKGeolocationPosition.d src\CoreFoundation\CFUtilities.d src\CoreFoundation\CFData.d src\WebKit2\WKGeolocationPermissionRequest.d src\WebKit2\WKView.d src\WebKit2\WKBaseWin.d src\CoreFoundation\CFDateFormatter.d src\CoreFoundation\CFTimeZone.d src\WebKit2\WKPreferences.d src\CoreFoundation\CoreFoundation.d src\WebKit2\WKNavigationData.d src\WebKit2\WKNumber.d src\WebKit2\WKNativeEvent.d src\WebKit2\WKPage.d src\CoreFoundation\CFSet.d src\WebKit2\WKFrame.d src\CoreFoundation\CFPreferences.d src\CoreFoundation\CFBase.d src\WebKit2\WKFormSubmissionListener.d src\CoreFoundation\CFArray.d src\WebKit2\WKType.d src\WebKit2\WKArray.d src\WebKit2\WKContext.d src\CoreFoundation\CFCharacterSet.d src\WebKit2\WebKit2_C.d src\WebKit2\WKGeometry.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFUUID.d src\WebKit2\WKData.d src\WebKit2\WKGeolocationManager.d src\WebKit2\WKMutableArray.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFNumber.d src\CoreFoundation\CFURLAccess.d src\WebKit2\WKURL.d src\CoreFoundation\CFStringEncodingExt.d src\WebKit2\WKURLResponse.d src\WebKit2\WKEvent.d src\WebKit2\WKBackForwardList.d src\WebKit2\WKBackForwardListItem.d src\WebKit2\WKDictionary.d src\CoreFoundation\CFError.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFBitVector.d src\CoreFoundation\CFTree.d src\WebKit2\WKError.d src\WebKit2\WKHitTestResult.d src\WebKit2\WKString.d src\WebKit2\WKOpenPanelResultListener.d src\WebKit2\WKPageGroup.d src\CoreFoundation\CFByteOrder.d src\CoreFoundation\CFCalendar.d src\WebKit2\WKBase.d src\CoreFoundation\CFNumberFormatter.d src\WebKit2\WKURLRequest.d src\CoreFoundation\CFBinaryHeap.d src\CoreFoundation\CFBag.d src\WebKit2\WKFindOptions.d src\WebKit2\WKFramePolicyListener.d src\WebKit2\WKConnectionRef.d src\WebKit2\WKPageLoadTypes.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFPropertyList.d src\WebKit2\WKGraphicsContext.d
TO_LINK = src\WebKit2\WKOpenPanelParameters.obj src\WebKit2\WKMutableDictionary.obj src\WebKit2\WKGeolocationPosition.obj src\CoreFoundation\CFUtilities.obj src\CoreFoundation\CFData.obj src\WebKit2\WKGeolocationPermissionRequest.obj src\WebKit2\WKView.obj src\WebKit2\WKBaseWin.obj src\CoreFoundation\CFDateFormatter.obj src\CoreFoundation\CFTimeZone.obj src\WebKit2\WKPreferences.obj src\CoreFoundation\CoreFoundation.obj src\WebKit2\WKNavigationData.obj src\WebKit2\WKNumber.obj src\WebKit2\WKNativeEvent.obj src\WebKit2\WKPage.obj src\CoreFoundation\CFSet.obj src\WebKit2\WKFrame.obj src\CoreFoundation\CFPreferences.obj src\CoreFoundation\CFBase.obj src\WebKit2\WKFormSubmissionListener.obj src\CoreFoundation\CFArray.obj src\WebKit2\WKType.obj src\WebKit2\WKArray.obj src\WebKit2\WKContext.obj src\CoreFoundation\CFCharacterSet.obj src\WebKit2\WebKit2_C.obj src\WebKit2\WKGeometry.obj src\CoreFoundation\CFLocale.obj src\CoreFoundation\CFUUID.obj src\WebKit2\WKData.obj src\WebKit2\WKGeolocationManager.obj src\WebKit2\WKMutableArray.obj src\CoreFoundation\CFDictionary.obj src\CoreFoundation\CFNumber.obj src\CoreFoundation\CFURLAccess.obj src\WebKit2\WKURL.obj src\CoreFoundation\CFStringEncodingExt.obj src\WebKit2\WKURLResponse.obj src\WebKit2\WKEvent.obj src\WebKit2\WKBackForwardList.obj src\WebKit2\WKBackForwardListItem.obj src\WebKit2\WKDictionary.obj src\CoreFoundation\CFError.obj src\CoreFoundation\CFDate.obj src\CoreFoundation\CFBitVector.obj src\CoreFoundation\CFTree.obj src\WebKit2\WKError.obj src\WebKit2\WKHitTestResult.obj src\WebKit2\WKString.obj src\WebKit2\WKOpenPanelResultListener.obj src\WebKit2\WKPageGroup.obj src\CoreFoundation\CFByteOrder.obj src\CoreFoundation\CFCalendar.obj src\WebKit2\WKBase.obj src\CoreFoundation\CFNumberFormatter.obj src\WebKit2\WKURLRequest.obj src\CoreFoundation\CFBinaryHeap.obj src\CoreFoundation\CFBag.obj src\WebKit2\WKFindOptions.obj src\WebKit2\WKFramePolicyListener.obj src\WebKit2\WKConnectionRef.obj src\WebKit2\WKPageLoadTypes.obj src\CoreFoundation\CFString.obj src\CoreFoundation\CFURL.obj src\CoreFoundation\CFPropertyList.obj src\WebKit2\WKGraphicsContext.obj
COMPILE_FLAG = -Isrc;import
LINK_FLAG =
EXT_LIB =
DDOC_FILE =
FLAG =

## LINK COMMAND
$(TARGET) : $(TO_LINK) $(EXT_LIB)
	lib -c $@ $**

## COMPILE RULE
.d.obj :
	dmd -c -g -op $(COMPILE_FLAG) $(FLAG) $<

## DEPENDENCE
$(TO_LINK) : $(MAKEFILE) $(EXT_LIB)
src\WebKit2\WKOpenPanelParameters.obj : src\WebKit2\WKOpenPanelParameters.d src\WebKit2\WKBase.d
src\WebKit2\WKMutableDictionary.obj : src\WebKit2\WKMutableDictionary.d src\WebKit2\WKBase.d
src\WebKit2\WKGeolocationPosition.obj : src\WebKit2\WKGeolocationPosition.d src\WebKit2\WKBase.d
src\CoreFoundation\CFUtilities.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFURLAccess.d src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CFCalendar.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFPropertyList.d src\CoreFoundation\CFUtilities.d
src\CoreFoundation\CFData.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFData.d
src\WebKit2\WKGeolocationPermissionRequest.obj : src\WebKit2\WKGeolocationPermissionRequest.d src\WebKit2\WKBase.d
src\WebKit2\WKView.obj : src\WebKit2\WKGeometry.d src\WebKit2\WKView.d src\WebKit2\WKBase.d
src\WebKit2\WKBaseWin.obj : src\WebKit2\WKBaseWin.d
src\CoreFoundation\CFDateFormatter.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFDateFormatter.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFLocale.d
src\CoreFoundation\CFTimeZone.obj : src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFArray.d
src\WebKit2\WKPreferences.obj : src\WebKit2\WKPreferences.d src\WebKit2\WKBase.d
src\CoreFoundation\CoreFoundation.obj : src\CoreFoundation\CFUtilities.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDateFormatter.d src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CoreFoundation.d src\CoreFoundation\CFSet.d src\CoreFoundation\CFPreferences.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFArray.d src\CoreFoundation\CFCharacterSet.d src\CoreFoundation\CFUUID.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFURLAccess.d src\CoreFoundation\CFNumber.d src\CoreFoundation\CFStringEncodingExt.d src\CoreFoundation\CFError.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFBitVector.d src\CoreFoundation\CFTree.d src\CoreFoundation\CFByteOrder.d src\CoreFoundation\CFCalendar.d src\CoreFoundation\CFNumberFormatter.d src\CoreFoundation\CFBinaryHeap.d src\CoreFoundation\CFBag.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFPropertyList.d
src\WebKit2\WKNavigationData.obj : src\WebKit2\WKNavigationData.d src\WebKit2\WKBase.d
src\WebKit2\WKNumber.obj : src\WebKit2\WKNumber.d src\WebKit2\WKBase.d
src\WebKit2\WKNativeEvent.obj : src\WebKit2\WKNativeEvent.d
src\WebKit2\WKPage.obj : src\WebKit2\WKEvent.d src\WebKit2\WKGeometry.d src\WebKit2\WKPage.d src\WebKit2\WKNativeEvent.d src\WebKit2\WKError.d src\WebKit2\WKPageLoadTypes.d src\WebKit2\WKBase.d src\WebKit2\WKFindOptions.d
src\CoreFoundation\CFSet.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFSet.d
src\WebKit2\WKFrame.obj : src\WebKit2\WKFrame.d src\WebKit2\WKBase.d
src\CoreFoundation\CFPreferences.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFPreferences.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CFBase.obj : src\CoreFoundation\CFBase.d
src\WebKit2\WKFormSubmissionListener.obj : src\WebKit2\WKFormSubmissionListener.d src\WebKit2\WKBase.d
src\CoreFoundation\CFArray.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFArray.d
src\WebKit2\WKType.obj : src\WebKit2\WKType.d src\WebKit2\WKBase.d
src\WebKit2\WKArray.obj : src\WebKit2\WKArray.d src\WebKit2\WKBase.d
src\WebKit2\WKContext.obj : src\WebKit2\WKContext.d src\WebKit2\WKBase.d
src\CoreFoundation\CFCharacterSet.obj : src\CoreFoundation\CFCharacterSet.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFData.d
src\WebKit2\WebKit2_C.obj : src\WebKit2\WKOpenPanelParameters.d src\WebKit2\WKMutableDictionary.d src\WebKit2\WKGeolocationPosition.d src\WebKit2\WKGeolocationPermissionRequest.d src\WebKit2\WKView.d src\WebKit2\WKPreferences.d src\WebKit2\WKNavigationData.d src\WebKit2\WKNumber.d src\WebKit2\WKPage.d src\WebKit2\WKFrame.d src\WebKit2\WKFormSubmissionListener.d src\WebKit2\WKArray.d src\WebKit2\WKContext.d src\WebKit2\WKType.d src\WebKit2\WebKit2_C.d src\WebKit2\WKGeolocationManager.d src\WebKit2\WKData.d src\WebKit2\WKMutableArray.d src\WebKit2\WKURL.d src\WebKit2\WKURLResponse.d src\WebKit2\WKBackForwardList.d src\WebKit2\WKBackForwardListItem.d src\WebKit2\WKDictionary.d src\WebKit2\WKError.d src\WebKit2\WKHitTestResult.d src\WebKit2\WKString.d src\WebKit2\WKOpenPanelResultListener.d src\WebKit2\WKPageGroup.d src\WebKit2\WKBase.d src\WebKit2\WKURLRequest.d src\WebKit2\WKFramePolicyListener.d src\WebKit2\WKConnectionRef.d src\WebKit2\WKGraphicsContext.d
src\WebKit2\WKGeometry.obj : src\WebKit2\WKGeometry.d src\WebKit2\WKBase.d
src\CoreFoundation\CFLocale.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CFUUID.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFUUID.d
src\WebKit2\WKData.obj : src\WebKit2\WKData.d src\WebKit2\WKBase.d
src\WebKit2\WKGeolocationManager.obj : src\WebKit2\WKGeolocationManager.d src\WebKit2\WKBase.d
src\WebKit2\WKMutableArray.obj : src\WebKit2\WKMutableArray.d src\WebKit2\WKBase.d
src\CoreFoundation\CFDictionary.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFDictionary.d
src\CoreFoundation\CFNumber.obj : src\CoreFoundation\CFNumber.d src\CoreFoundation\CFBase.d
src\CoreFoundation\CFURLAccess.obj : src\CoreFoundation\CFURLAccess.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFArray.d
src\WebKit2\WKURL.obj : src\WebKit2\WKURL.d src\WebKit2\WKBase.d
src\CoreFoundation\CFStringEncodingExt.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFStringEncodingExt.d
src\WebKit2\WKURLResponse.obj : src\WebKit2\WKURLResponse.d src\WebKit2\WKBase.d
src\WebKit2\WKEvent.obj : src\WebKit2\WKEvent.d src\WebKit2\WKBase.d
src\WebKit2\WKBackForwardList.obj : src\WebKit2\WKBackForwardList.d src\WebKit2\WKBase.d
src\WebKit2\WKBackForwardListItem.obj : src\WebKit2\WKBackForwardListItem.d src\WebKit2\WKBase.d
src\WebKit2\WKDictionary.obj : src\WebKit2\WKDictionary.d src\WebKit2\WKBase.d
src\CoreFoundation\CFError.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFError.d src\CoreFoundation\CFDictionary.d
src\CoreFoundation\CFDate.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFDate.d
src\CoreFoundation\CFBitVector.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFBitVector.d
src\CoreFoundation\CFTree.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFTree.d
src\WebKit2\WKError.obj : src\WebKit2\WKError.d src\WebKit2\WKBase.d
src\WebKit2\WKHitTestResult.obj : src\WebKit2\WKHitTestResult.d src\WebKit2\WKBase.d
src\WebKit2\WKString.obj : src\WebKit2\WKString.d src\WebKit2\WKBase.d
src\WebKit2\WKOpenPanelResultListener.obj : src\WebKit2\WKOpenPanelResultListener.d src\WebKit2\WKBase.d
src\WebKit2\WKPageGroup.obj : src\WebKit2\WKPageGroup.d src\WebKit2\WKBase.d
src\CoreFoundation\CFByteOrder.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFByteOrder.d
src\CoreFoundation\CFCalendar.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CFCalendar.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFDate.d
src\WebKit2\WKBase.obj : src\WebKit2\WKBaseWin.d src\WebKit2\WKBase.d
src\CoreFoundation\CFNumberFormatter.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFNumber.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFNumberFormatter.d
src\WebKit2\WKURLRequest.obj : src\WebKit2\WKURLRequest.d src\WebKit2\WKBase.d
src\CoreFoundation\CFBinaryHeap.obj : src\CoreFoundation\CFBinaryHeap.d src\CoreFoundation\CFBase.d
src\CoreFoundation\CFBag.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFBag.d
src\WebKit2\WKFindOptions.obj : src\WebKit2\WKFindOptions.d
src\WebKit2\WKFramePolicyListener.obj : src\WebKit2\WKFramePolicyListener.d src\WebKit2\WKBase.d
src\WebKit2\WKConnectionRef.obj : src\WebKit2\WKConnectionRef.d src\WebKit2\WKBase.d
src\WebKit2\WKPageLoadTypes.obj : src\WebKit2\WKPageLoadTypes.d
src\CoreFoundation\CFString.obj : src\CoreFoundation\CFString.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFCharacterSet.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CFURL.obj : src\CoreFoundation\CFURL.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFData.d src\CoreFoundation\CFError.d
src\CoreFoundation\CFPropertyList.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFData.d src\CoreFoundation\CFError.d src\CoreFoundation\CFPropertyList.d
src\WebKit2\WKGraphicsContext.obj : src\WebKit2\WKGraphicsContext.d src\WebKit2\WKBase.d

## PHONY TARGET
debug-all :
	dmd -g -debug -of$(TARGET) $(COMPILE_FLAG) $(LINK_FLAG) $(TO_COMPILE) $(EXT_LIB)  $(FLAG)
release :
	dmd -c -op -release -O -inline -lib -of$(TARGET) $(COMPILE_FLAG) $(LINK_FLAG) $(EXT_LIB) $(TO_COMPILE) $(FLAG)  $(FLAG)
clean :
	del $(TARGET) $(TO_LINK)
clean_obj :
	del $(TO_LINK)
vwrite :
	vwrite -ver="0.0003(dmd2.060)" -prj=$(TARGET) $(TO_COMPILE)
ddoc :
	dmd -c -o- -op -D -Dd $(COMPILE_FLAG) $(DDOC_FILE) $(TO_COMPILE) $(FLAG)
show :
	@echo ROOT = src\CoreFoundation\CoreFoundation.d src\WebKit2\WebKit2_C.d
	@echo TARGET = $(TARGET)
	@echo VERSION = 0.0003(dmd2.060)
run :
	$(TARGET) $(FLAG)
edit :
	emacs $(TO_COMPILE)
remake :
	amm v=0.0003(dmd2.060) WebKit2d.mak lib= -oflib\WebKit2d.lib .\src\CoreFoundation\CoreFoundation.d .\src\WebKit2\WebKit2_C.d $(FLAG)

debug :
	ddbg $(TARGET)

## generated by amm.