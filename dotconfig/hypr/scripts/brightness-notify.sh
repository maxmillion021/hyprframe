#!/usr/bin/env bash
# Brightness notification for dunst

get_brightness() {
    brightnessctl -m | cut -d, -f4 | tr -d '%'
}

case "$1" in
    up)
        brightnessctl set 5%+
        br=$(get_brightness)
        notify-send -r 101 "Brightness" "$br%" -h int:value:$br -u low
        ;;
    down)
        brightnessctl set 5%-
        br=$(get_brightness)
        notify-send -r 101 "Brightness" "$br%" -h int:value:$br -u low
        ;;
esac
