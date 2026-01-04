#!/usr/bin/env bash

PROC=$(pgrep -af openvpn)

if [[ -z "$PROC" ]]; then
    echo "🚫"
else
    NAME=$(echo "$PROC" | grep -oE '[^/]+\.ovpn')
    echo "$NAME"
fi

