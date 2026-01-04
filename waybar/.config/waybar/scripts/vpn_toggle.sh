#!/usr/bin/env bash

# OVPN padrão (caso queira uma específica)
DEFAULT_OVPN="$HOME/vpn/buangelo.ovpn"

if pgrep -af openvpn > /dev/null; then
    # Desconectar
    pkill openvpn
else
    # Conectar
    sudo openvpn "$DEFAULT_OVPN" &
fi
