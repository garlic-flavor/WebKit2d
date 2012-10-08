## MACRO
TARGET = MiniBrowser.dll
MAKE = make
MAKEFILE = browser_dll.mak
TO_COMPILE = src\CoreFoundation\CFStream.d src\WebKit2\WKOpenPanelParameters.d src\WebKit2\WKMutableDictionary.d src\mBrowser\BrowserWindow.d src\CoreFoundation\CFBundle.d src\WebKit2\WKGeolocationPosition.d src\CoreFoundation\CFData.d src\WebKit2\WKGeolocationPermissionRequest.d src\WebKit2\WKView.d src\CoreFoundation\CFDateFormatter.d src\WebKit2\WKBaseWin.d src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CoreFoundation.d src\WebKit2\WKPreferences.d src\WebKit2\WKNavigationData.d src\WebKit2\WKNumber.d src\WebKit2\WKPage.d src\WebKit2\WKNativeEvent.d src\CoreFoundation\CFMachPort.d src\WebKit2\WKFrame.d src\CoreFoundation\CFLogUtilities.d src\CoreFoundation\CFSet.d src\CoreFoundation\CFPreferences.d src\CoreFoundation\CFSocket.d src\mBrowser\BrowserView.d src\CoreFoundation\CFXMLParser.d src\mBrowser\resource.d src\WebKit2\WKFormSubmissionListener.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFPlugIn.d src\mBrowser\MiniBrowser.d src\WebKit2\WKArray.d src\WebKit2\WKContext.d src\WebKit2\WKType.d src\CoreFoundation\CFArray.d src\WebKit2\WebKit2_C.d src\mBrowser\main.d src\WebKit2\WKGeometry.d src\CoreFoundation\CFCharacterSet.d src\WebKit2\WKGeolocationManager.d src\WebKit2\WKData.d src\WebKit2\WKMutableArray.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFUUID.d src\WebKit2\WKURL.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFNumber.d src\CoreFoundation\CFURLAccess.d src\CoreFoundation\CFXMLNode.d src\WebKit2\WKURLResponse.d src\CoreFoundation\CFStringEncodingExt.d src\WebKit2\WKEvent.d src\WebKit2\WKBackForwardList.d src\WebKit2\WKURLCF.d src\WebKit2\WKBackForwardListItem.d src\WebKit2\WKDictionary.d src\WebKit2\WKError.d src\WebKit2\WKHitTestResult.d src\WebKit2\WKString.d src\CoreFoundation\CFBitVector.d src\CoreFoundation\CFError.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFTree.d src\WebKit2\WKOpenPanelResultListener.d src\WebKit2\WKPageGroup.d src\WebKit2\WKBase.d src\CoreFoundation\CFByteOrder.d src\CoreFoundation\CFCalendar.d src\WebKit2\WKURLRequest.d src\CoreFoundation\CFNumberFormatter.d src\WebKit2\WKContextPrivate.d src\CoreFoundation\CFBinaryHeap.d src\CoreFoundation\CFRunLoop.d src\WebKit2\WKFindOptions.d src\CoreFoundation\CFBag.d src\CoreFoundation\CFMessagePort.d src\WebKit2\WKConnectionRef.d src\WebKit2\WKPageLoadTypes.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\WebKit2\WKGraphicsContext.d src\CoreFoundation\CFPropertyList.d
TO_LINK = src\mBrowser\MiniBrowser.res src\CoreFoundation\CFStream.obj src\WebKit2\WKOpenPanelParameters.obj src\WebKit2\WKMutableDictionary.obj src\mBrowser\BrowserWindow.obj src\CoreFoundation\CFBundle.obj src\WebKit2\WKGeolocationPosition.obj src\CoreFoundation\CFData.obj src\WebKit2\WKGeolocationPermissionRequest.obj src\WebKit2\WKView.obj src\CoreFoundation\CFDateFormatter.obj src\WebKit2\WKBaseWin.obj src\CoreFoundation\CFTimeZone.obj src\CoreFoundation\CoreFoundation.obj src\WebKit2\WKPreferences.obj src\WebKit2\WKNavigationData.obj src\WebKit2\WKNumber.obj src\WebKit2\WKPage.obj src\WebKit2\WKNativeEvent.obj src\CoreFoundation\CFMachPort.obj src\WebKit2\WKFrame.obj src\CoreFoundation\CFLogUtilities.obj src\CoreFoundation\CFSet.obj src\CoreFoundation\CFPreferences.obj src\CoreFoundation\CFSocket.obj src\mBrowser\BrowserView.obj src\CoreFoundation\CFXMLParser.obj src\mBrowser\resource.obj src\WebKit2\WKFormSubmissionListener.obj src\CoreFoundation\CFBase.obj src\CoreFoundation\CFPlugIn.obj src\mBrowser\MiniBrowser.obj src\WebKit2\WKArray.obj src\WebKit2\WKContext.obj src\WebKit2\WKType.obj src\CoreFoundation\CFArray.obj src\WebKit2\WebKit2_C.obj src\mBrowser\main.obj src\WebKit2\WKGeometry.obj src\CoreFoundation\CFCharacterSet.obj src\WebKit2\WKGeolocationManager.obj src\WebKit2\WKData.obj src\WebKit2\WKMutableArray.obj src\CoreFoundation\CFLocale.obj src\CoreFoundation\CFUUID.obj src\WebKit2\WKURL.obj src\CoreFoundation\CFDictionary.obj src\CoreFoundation\CFNumber.obj src\CoreFoundation\CFURLAccess.obj src\CoreFoundation\CFXMLNode.obj src\WebKit2\WKURLResponse.obj src\CoreFoundation\CFStringEncodingExt.obj src\WebKit2\WKEvent.obj src\WebKit2\WKBackForwardList.obj src\WebKit2\WKURLCF.obj src\WebKit2\WKBackForwardListItem.obj src\WebKit2\WKDictionary.obj src\WebKit2\WKError.obj src\WebKit2\WKHitTestResult.obj src\WebKit2\WKString.obj src\CoreFoundation\CFBitVector.obj src\CoreFoundation\CFError.obj src\CoreFoundation\CFDate.obj src\CoreFoundation\CFTree.obj src\WebKit2\WKOpenPanelResultListener.obj src\WebKit2\WKPageGroup.obj src\WebKit2\WKBase.obj src\CoreFoundation\CFByteOrder.obj src\CoreFoundation\CFCalendar.obj src\WebKit2\WKURLRequest.obj src\CoreFoundation\CFNumberFormatter.obj src\WebKit2\WKContextPrivate.obj src\CoreFoundation\CFBinaryHeap.obj src\CoreFoundation\CFRunLoop.obj src\WebKit2\WKFindOptions.obj src\CoreFoundation\CFBag.obj src\CoreFoundation\CFMessagePort.obj src\WebKit2\WKConnectionRef.obj src\WebKit2\WKPageLoadTypes.obj src\CoreFoundation\CFString.obj src\CoreFoundation\CFURL.obj src\WebKit2\WKGraphicsContext.obj src\CoreFoundation\CFPropertyList.obj
RC_FILE = src\mBrowser\MiniBrowser.rc
RES_FILE = src\mBrowser\MiniBrowser.res
COMPILE_FLAG = -version=Unicode -version=WindowsVista -Isrc;import
LINK_FLAG =
EXT_LIB = lib\AdvAPI32.Lib lib\ComCtl32.Lib lib\CoreFoundation.lib lib\Gdi32.Lib lib\WebKit.lib lib\win32.lib
DEF_FILE = src\mBrowser\MiniBrowser.def
DDOC_FILE =
FLAG =

## LINK COMMAND
$(TARGET) : $(TO_LINK) $(EXT_LIB)
	dmd -g -map -L/IMPLIB -of$(TARGET) $(LINK_FLAG)  $(EXT_LIB) $(TO_LINK) $(DEF_FILE) $(FLAG)

## COMPILE RULE
.d.obj :
	dmd -c -g -op $(COMPILE_FLAG) $(FLAG) $<
.rc.res :
	rc -R $<

## DEPENDENCE
$(TO_LINK) : $(MAKEFILE) $(EXT_LIB)
src\CoreFoundation\CFStream.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFRunLoop.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFError.d src\CoreFoundation\CFSocket.d src\CoreFoundation\CFStream.d
src\WebKit2\WKOpenPanelParameters.obj : src\WebKit2\WKOpenPanelParameters.d src\WebKit2\WKBase.d
src\WebKit2\WKMutableDictionary.obj : src\WebKit2\WKMutableDictionary.d src\WebKit2\WKBase.d
src\mBrowser\BrowserWindow.obj : src\mBrowser\BrowserWindow.d src\mBrowser\resource.d src\mBrowser\BrowserView.d src\mBrowser\MiniBrowser.d
src\CoreFoundation\CFBundle.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFBundle.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFError.d src\CoreFoundation\CFArray.d
src\WebKit2\WKGeolocationPosition.obj : src\WebKit2\WKGeolocationPosition.d src\WebKit2\WKBase.d
src\CoreFoundation\CFData.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFData.d
src\WebKit2\WKGeolocationPermissionRequest.obj : src\WebKit2\WKGeolocationPermissionRequest.d src\WebKit2\WKBase.d
src\WebKit2\WKView.obj : src\WebKit2\WKGeometry.d src\WebKit2\WKView.d src\WebKit2\WKBase.d
src\CoreFoundation\CFDateFormatter.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFDateFormatter.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFLocale.d
src\WebKit2\WKBaseWin.obj : src\WebKit2\WKBaseWin.d
src\CoreFoundation\CFTimeZone.obj : src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CoreFoundation.obj : src\CoreFoundation\CFStream.d src\CoreFoundation\CFBundle.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDateFormatter.d src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CoreFoundation.d src\CoreFoundation\CFMachPort.d src\CoreFoundation\CFSet.d src\CoreFoundation\CFLogUtilities.d src\CoreFoundation\CFSocket.d src\CoreFoundation\CFPreferences.d src\CoreFoundation\CFXMLParser.d src\CoreFoundation\CFPlugIn.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFArray.d src\CoreFoundation\CFCharacterSet.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFUUID.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFNumber.d src\CoreFoundation\CFURLAccess.d src\CoreFoundation\CFXMLNode.d src\CoreFoundation\CFStringEncodingExt.d src\CoreFoundation\CFError.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFBitVector.d src\CoreFoundation\CFTree.d src\CoreFoundation\CFByteOrder.d src\CoreFoundation\CFCalendar.d src\CoreFoundation\CFNumberFormatter.d src\CoreFoundation\CFBinaryHeap.d src\CoreFoundation\CFRunLoop.d src\CoreFoundation\CFBag.d src\CoreFoundation\CFMessagePort.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFPropertyList.d
src\WebKit2\WKPreferences.obj : src\WebKit2\WKPreferences.d src\WebKit2\WKBase.d
src\WebKit2\WKNavigationData.obj : src\WebKit2\WKNavigationData.d src\WebKit2\WKBase.d
src\WebKit2\WKNumber.obj : src\WebKit2\WKNumber.d src\WebKit2\WKBase.d
src\WebKit2\WKPage.obj : src\WebKit2\WKEvent.d src\WebKit2\WKGeometry.d src\WebKit2\WKPage.d src\WebKit2\WKNativeEvent.d src\WebKit2\WKError.d src\WebKit2\WKPageLoadTypes.d src\WebKit2\WKBase.d src\WebKit2\WKFindOptions.d
src\WebKit2\WKNativeEvent.obj : src\WebKit2\WKNativeEvent.d
src\CoreFoundation\CFMachPort.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFRunLoop.d src\CoreFoundation\CFMachPort.d
src\WebKit2\WKFrame.obj : src\WebKit2\WKFrame.d src\WebKit2\WKBase.d
src\CoreFoundation\CFLogUtilities.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFLogUtilities.d
src\CoreFoundation\CFSet.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFSet.d
src\CoreFoundation\CFPreferences.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFPreferences.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CFSocket.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFRunLoop.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFSocket.d
src\mBrowser\BrowserView.obj : src\WebKit2\WKEvent.d src\WebKit2\WKURLCF.d src\mBrowser\BrowserWindow.d src\mBrowser\BrowserView.d src\WebKit2\WebKit2_C.d src\WebKit2\WKContextPrivate.d
src\CoreFoundation\CFXMLParser.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFTree.d src\CoreFoundation\CFArray.d src\CoreFoundation\CFXMLNode.d src\CoreFoundation\CFXMLParser.d
src\mBrowser\resource.obj : src\mBrowser\resource.d
src\WebKit2\WKFormSubmissionListener.obj : src\WebKit2\WKFormSubmissionListener.d src\WebKit2\WKBase.d
src\CoreFoundation\CFBase.obj : src\CoreFoundation\CFBase.d
src\CoreFoundation\CFPlugIn.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFBundle.d src\CoreFoundation\CFPlugIn.d src\CoreFoundation\CFArray.d src\CoreFoundation\CFUUID.d
src\mBrowser\MiniBrowser.obj : src\mBrowser\BrowserWindow.d src\mBrowser\MiniBrowser.d
src\WebKit2\WKArray.obj : src\WebKit2\WKArray.d src\WebKit2\WKBase.d
src\WebKit2\WKContext.obj : src\WebKit2\WKContext.d src\WebKit2\WKBase.d
src\WebKit2\WKType.obj : src\WebKit2\WKType.d src\WebKit2\WKBase.d
src\CoreFoundation\CFArray.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFArray.d
src\WebKit2\WebKit2_C.obj : src\WebKit2\WKOpenPanelParameters.d src\WebKit2\WKMutableDictionary.d src\WebKit2\WKGeolocationPosition.d src\WebKit2\WKGeolocationPermissionRequest.d src\WebKit2\WKView.d src\WebKit2\WKPreferences.d src\WebKit2\WKNavigationData.d src\WebKit2\WKNumber.d src\WebKit2\WKPage.d src\WebKit2\WKFrame.d src\WebKit2\WKFormSubmissionListener.d src\WebKit2\WKArray.d src\WebKit2\WKContext.d src\WebKit2\WKType.d src\WebKit2\WebKit2_C.d src\WebKit2\WKGeolocationManager.d src\WebKit2\WKData.d src\WebKit2\WKMutableArray.d src\WebKit2\WKURL.d src\WebKit2\WKURLResponse.d src\WebKit2\WKBackForwardList.d src\WebKit2\WKBackForwardListItem.d src\WebKit2\WKDictionary.d src\WebKit2\WKError.d src\WebKit2\WKHitTestResult.d src\WebKit2\WKString.d src\WebKit2\WKOpenPanelResultListener.d src\WebKit2\WKPageGroup.d src\WebKit2\WKBase.d src\WebKit2\WKURLRequest.d src\WebKit2\WKConnectionRef.d src\WebKit2\WKGraphicsContext.d
src\mBrowser\main.obj : src\mBrowser\main.d src\mBrowser\BrowserWindow.d src\mBrowser\MiniBrowser.d src\mBrowser\BrowserView.d
src\WebKit2\WKGeometry.obj : src\WebKit2\WKGeometry.d src\WebKit2\WKBase.d
src\CoreFoundation\CFCharacterSet.obj : src\CoreFoundation\CFCharacterSet.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFData.d
src\WebKit2\WKGeolocationManager.obj : src\WebKit2\WKGeolocationManager.d src\WebKit2\WKBase.d
src\WebKit2\WKData.obj : src\WebKit2\WKData.d src\WebKit2\WKBase.d
src\WebKit2\WKMutableArray.obj : src\WebKit2\WKMutableArray.d src\WebKit2\WKBase.d
src\CoreFoundation\CFLocale.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CFUUID.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFUUID.d
src\WebKit2\WKURL.obj : src\WebKit2\WKURL.d src\WebKit2\WKBase.d
src\CoreFoundation\CFDictionary.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFDictionary.d
src\CoreFoundation\CFNumber.obj : src\CoreFoundation\CFNumber.d src\CoreFoundation\CFBase.d
src\CoreFoundation\CFURLAccess.obj : src\CoreFoundation\CFURLAccess.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CFXMLNode.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFURL.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFTree.d src\CoreFoundation\CFXMLNode.d src\CoreFoundation\CFArray.d
src\WebKit2\WKURLResponse.obj : src\WebKit2\WKURLResponse.d src\WebKit2\WKBase.d
src\CoreFoundation\CFStringEncodingExt.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFStringEncodingExt.d
src\WebKit2\WKEvent.obj : src\WebKit2\WKEvent.d src\WebKit2\WKBase.d
src\WebKit2\WKBackForwardList.obj : src\WebKit2\WKBackForwardList.d src\WebKit2\WKBase.d
src\WebKit2\WKURLCF.obj : src\WebKit2\WKURLCF.d src\CoreFoundation\CoreFoundation.d src\WebKit2\WKBase.d
src\WebKit2\WKBackForwardListItem.obj : src\WebKit2\WKBackForwardListItem.d src\WebKit2\WKBase.d
src\WebKit2\WKDictionary.obj : src\WebKit2\WKDictionary.d src\WebKit2\WKBase.d
src\WebKit2\WKError.obj : src\WebKit2\WKError.d src\WebKit2\WKBase.d
src\WebKit2\WKHitTestResult.obj : src\WebKit2\WKHitTestResult.d src\WebKit2\WKBase.d
src\WebKit2\WKString.obj : src\WebKit2\WKString.d src\WebKit2\WKBase.d
src\CoreFoundation\CFBitVector.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFBitVector.d
src\CoreFoundation\CFError.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFError.d src\CoreFoundation\CFDictionary.d
src\CoreFoundation\CFDate.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFDate.d
src\CoreFoundation\CFTree.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFTree.d
src\WebKit2\WKOpenPanelResultListener.obj : src\WebKit2\WKOpenPanelResultListener.d src\WebKit2\WKBase.d
src\WebKit2\WKPageGroup.obj : src\WebKit2\WKPageGroup.d src\WebKit2\WKBase.d
src\WebKit2\WKBase.obj : src\WebKit2\WKBaseWin.d src\WebKit2\WKBase.d
src\CoreFoundation\CFByteOrder.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFByteOrder.d
src\CoreFoundation\CFCalendar.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFTimeZone.d src\CoreFoundation\CFCalendar.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFDate.d
src\WebKit2\WKURLRequest.obj : src\WebKit2\WKURLRequest.d src\WebKit2\WKBase.d
src\CoreFoundation\CFNumberFormatter.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFNumber.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFNumberFormatter.d
src\WebKit2\WKContextPrivate.obj : src\WebKit2\WKContext.d src\WebKit2\WKContextPrivate.d src\WebKit2\WKBase.d
src\CoreFoundation\CFBinaryHeap.obj : src\CoreFoundation\CFBinaryHeap.d src\CoreFoundation\CFBase.d
src\CoreFoundation\CFRunLoop.obj : src\CoreFoundation\CFRunLoop.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFDate.d src\CoreFoundation\CFArray.d
src\WebKit2\WKFindOptions.obj : src\WebKit2\WKFindOptions.d
src\CoreFoundation\CFBag.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFBag.d
src\CoreFoundation\CFMessagePort.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFRunLoop.d src\CoreFoundation\CFMessagePort.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDate.d
src\WebKit2\WKConnectionRef.obj : src\WebKit2\WKConnectionRef.d src\WebKit2\WKBase.d
src\WebKit2\WKPageLoadTypes.obj : src\WebKit2\WKPageLoadTypes.d
src\CoreFoundation\CFString.obj : src\CoreFoundation\CFString.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFCharacterSet.d src\CoreFoundation\CFData.d src\CoreFoundation\CFDictionary.d src\CoreFoundation\CFLocale.d src\CoreFoundation\CFArray.d
src\CoreFoundation\CFURL.obj : src\CoreFoundation\CFURL.d src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFData.d
src\WebKit2\WKGraphicsContext.obj : src\WebKit2\WKGraphicsContext.d src\WebKit2\WKBase.d
src\CoreFoundation\CFPropertyList.obj : src\CoreFoundation\CFBase.d src\CoreFoundation\CFString.d src\CoreFoundation\CFData.d src\CoreFoundation\CFError.d src\CoreFoundation\CFPropertyList.d src\CoreFoundation\CFStream.d
src\mBrowser\MiniBrowser.res : src\mBrowser\MiniBrowser.rc

## PHONY TARGET
debug-all : $(RES_FILE)
	dmd -g -debug -of$(TARGET) $(COMPILE_FLAG) $(LINK_FLAG) $(TO_COMPILE) $(EXT_LIB) $(RES_FILE) $(FLAG)
release : $(RES_FILE)
	dmd -op -release -O -inline -map -L/IMPLIB -of$(TARGET) $(LINK_FLAG) $(EXT_LIB) $(COMPILE_FLAG) $(TO_COMPILE) $(FLAG) $(RES_FILE) $(FLAG)
clean :
	del $(TARGET) $(TO_LINK)
clean_obj :
	del $(TO_LINK)
vwrite :
	vwrite -ver="0.0001(dmd2.060)" -prj=$(TARGET) $(TO_COMPILE)
ddoc :
	dmd -c -o- -op -D -Dddoc $(COMPILE_FLAG) $(DDOC_FILE) $(TO_COMPILE) $(FLAG)
show :
	@echo ROOT = src\mBrowser\main.d
	@echo TARGET = $(TARGET)
	@echo VERSION = 0.0001(dmd2.060)
run :
	$(TARGET) $(FLAG)
edit :
	emacs $(TO_COMPILE) $(RC_FILE) browser_dll.mak
remake :
	amm vwrite=0.0001(dmd2.060) makefile=browser_dll.mak MiniBrowser.dll src/mBrowser/main.d src/mBrowser/MiniBrowser.def src/mBrowser/MiniBrowser.rc $(FLAG)

debug :
	ddbg $(TARGET)

## generated by amm.