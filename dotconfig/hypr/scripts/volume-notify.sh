#!/usr/bin/env bash
# Volume notification for dunst

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

get_mute() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "yes" || echo "no"
}

case "$1" in
    up)
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        vol=$(get_volume)
        notify-send -r 100 "Volume" "$vol%" -h int:value:$vol -u low
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        vol=$(get_volume)
        notify-send -r 100 "Volume" "$vol%" -h int:value:$vol -u low
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        if [ "$(get_mute)" = "yes" ]; then
            notify-send -r 100 "Muted" -u low
        else
            vol=$(get_volume)
            notify-send -r 100 "Unmuted" "$vol%" -h int:value:$vol -u low
        fi
        ;;
esac
