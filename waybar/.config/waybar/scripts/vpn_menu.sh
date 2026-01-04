#!/usr/bin/env bash

DIR="$HOME/vpn"  # pasta onde estão os .ovpn

CHOICE=$(ls "$DIR"/*.ovpn 2>/dev/null | walker --dmenu --prompt "Select VPN")

if [[ -n "$CHOICE" ]]; then
    pkill openvpn
    sudo openvpn "$CHOICE" &
fi

