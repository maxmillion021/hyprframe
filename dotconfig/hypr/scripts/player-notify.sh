#!/usr/bin/env bash
# Media notification for dunst

PLAYER="playerctl -p spotify,mpv,firefox,chromium"
STATUS=$($PLAYER status 2>/dev/null)

if [ "$STATUS" = "Playing" ]; then
    ARTIST=$($PLAYER metadata artist 2>/dev/null)
    TITLE=$($PLAYER metadata title 2>/dev/null)
    notify-send -r 102 "▶ Playing" "$ARTIST - $TITLE" -u low
elif [ "$STATUS" = "Paused" ]; then
    ARTIST=$($PLAYER metadata artist 2>/dev/null)
    TITLE=$($PLAYER metadata title 2>/dev/null)
    notify-send -r 102 "⏸ Paused" "$ARTIST - $TITLE" -u low
fi
