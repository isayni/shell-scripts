#!/bin/bash
#
# script run by monitor udev rules.
# manage connected/disconneted HDMI monitor to
# mirror the primary screen
#
export DISPLAY=:0
export XAUTHORITY=/home/lenny/.Xauthority

connect() {
    # DisplayPort-0 - default monitor
    xrandr --output $1 --same-as "DisplayPort-0" --mode 1920x1080
}
disconnect() {
    xrandr --output $1 --off
}
main() {
    # Ports to check
    for disp in 'HDMI-A-0' 'HDMI-A-1' 'HDMI-A-2'; do
        xrandr --query | grep "$disp connected" &> /dev/null && connect $disp || disconnect $disp
    done
}

main &
