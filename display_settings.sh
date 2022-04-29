#!/bin/bash

dmode="$(cat /sys/class/drm/card0-DP-1/status)"

if [ "${dmode}" = disconnected ]
then 
    #One display
    xrandr --output eDP-1 --mode 2560x1440
    xfce4-panel --restart
    xfconf-query -c xfwm4 -p /general/margin_right -s 220
    xfconf-query -c xfwm4 -p /general/margin_left -s 10
    xfconf-query -c xfwm4 -p /general/margin_top -s 60
    xfconf-query -c xfwm4 -p /general/margin_bottom -s 10
else
    #Two display
    xfce4-panel --restart
    xfconf-query -c xfwm4 -p /general/margin_right -s 0
    xfconf-query -c xfwm4 -p /general/margin_left -s 0
    xfconf-query -c xfwm4 -p /general/margin_top -s 60
    xfconf-query -c xfwm4 -p /general/margin_bottom -s 0
fi
