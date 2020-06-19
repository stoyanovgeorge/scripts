#!/bin/bash


# Please define the device type
device_type="Touchpad"
# Finding the numeric ID of the device type
device_id=$(xinput | sed "/$device_type/s/.*id=\([0-9]*\).*/\1/;t;d")
# Findng whether the device_id is enabled or disabled 1 - means enabled, 0 means disabled
device_state=$(xinput list-props "$device_id" | awk '/^\tDevice Enabled \([0-9]+\):\t[01]/ {print $NF}')

case "$device_state" in
    0)  
        xinput enable "$device_id"
        echo "$device_type is enabled"
        ;;  
    1)  
        xinput disable "$device_id"
        echo "$device_type is disabled"
        ;;  
esac
