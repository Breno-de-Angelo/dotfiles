#!/bin/bash

if [ -f "/tmp/recording_pid" ]; then
    # Recording is active
    echo '{"text": "󰻂", "tooltip": "Stop Recording", "class": "active"}'
else
    # Not recording
    echo '{"text": ""}'
fi
