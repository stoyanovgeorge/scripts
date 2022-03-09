#!/bin/bash

if [ "$(xrandr | grep -o "HDMI-1-1")" == "HDMI-1-1" ];	
then
  xrandr --output eDP-1-1 --off
  xrandr --addmode HDMI-1-1 3440x1440_44.00
  xrandr --output HDMI-1-1 --mode 3440x1440_44.00
elif [ "$(xrandr | grep -o "HDMI-1")" == "HDMI-1" ]; 
then
  xrandr --output eDP-1 --off
  xrandr --addmode HDMI-1 3440x1440_44.00
  xrandr --output HDMI-1 --mode 3440x1440_44.00
fi
