#!/bin/sh
cd /app
if test ! -d RoonServer; then
    if test -z "$ROON_SERVER_URL" -o -z "$ROON_SERVER_PKG"; then
	echo "Missing URL ROON_SERVER_URL and/or app name ROON_SERVER_PKG"
	exit 1
    fi
    curl -L "$ROON_SERVER_URL" -O
    tar xjf "$ROON_SERVER_PKG"
    rm -f "$ROON_SERVER_PKG"
fi
