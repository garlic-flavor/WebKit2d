# はじめにお読み下さい。 - WebKit2d - #

これは、[WebKit2](http://trac.webkit.org/wiki/WebKit2 "WebKit2")をD言語から扱うためのものです。

[WebKit2](http://trac.webkit.org/wiki/WebKit2 "WebKit2")は[WebKit](http://www.webkit.org/ "WebKit")のC言語向けインターフェイスです。

同梱のサンプル、MiniBrowser.exe は、WebKitに付属のサンプル、MiniBrowserをD言語に移植したものです。

Safari がインストールされている環境で実行してください。

バイナリは全て 32Bit Windows用です。

## ヴァージョン ##
- WebKit r130691
- CoreFoundation 744.12

を元に書かれています。

## 謝辞 ##
- [DigitalMars D Programming Language](http://dlang.org/ "D Programming Language") を利用しています。
- [WindowsAPI Bindings](http://dsource.org/projects/bindings/wiki/WindowsApi "WindowsAPI") を利用しています。

## テスト環境 ##
- Windows Vista 64bit ( on WOW64)
- dmd 2.060
- Safari 5.1.7

## ライセンス ##
ライセンスは [CC0](http://creativecommons.org/publicdomain/zero/1.0/ "CC0") です。


## 更新履歴 ##

- 2012/10/10 ver 0.0002(dmd2.060)
  WebKit と CoreFoundation を新しいのに

- 2012/10/09 ver 0.0001(dmd2.060)
  first release
