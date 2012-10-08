/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/
module WebKit2.WKConnectionRef;

import WebKit2.WKBase;

extern(C):

alias extern(C) void function( WKConnectionRef, WKStringRef, WKTypeRef, const(void)* ) WKConnectionDidReceiveMessageCallback;
alias extern(C) void function( WKConnectionRef, const(void)* ) WKConnectionDidCloseCallback;

struct WKConnectionClient
{
	int _version;
	const(void)* clientInfo;
	WKConnectionDidReceiveMessageCallback didReceiveMessage;
	WKConnectionDidCloseCallback didClose;
}

enum WKConnectionClientCurrentVersion = 0;

WKTypeID WKConnectionGetTypeID();

void WKConnectionSetConnectionClient(WKConnectionRef connection, const WKConnectionClient* client);
void WKConnectionPostMessage(WKConnectionRef connection, WKStringRef messageName, WKTypeRef messageBody);
