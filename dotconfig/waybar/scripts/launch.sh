#!/bin/bash

killall -9 waybar
blueman-applet &
waybar &
