#!/bin/env sh

pkill polybar

sleep 1

TOPPAD=25
BOTPAD=0
if ~/bin/is-workmon ; then
    echo "--- Work Config ---"
    AUXMON1=DP-3-1
    AUXMON2=DP-3-2
    bspc config -m $AUXMON1 top_padding    $TOPPAD
    bspc config -m $AUXMON2 top_padding    $TOPPAD
    bspc config -m $AUXMON1 bottom_padding $BOTPAD
    bspc config -m $AUXMON2 bottom_padding $BOTPAD
    polybar -q auxwork1 -c /home/pvetere/.config/polybar/config.ini &
    polybar -q auxwork2 -c /home/pvetere/.config/polybar/config.ini &
else
    echo "--- Home Config ---"
    AUXMON=HDMI-1
    bspc config -m $AUXMON top_padding     $TOPPAD
    bspc config -m $AUXMON bottom_padding  $BOTPAD
    polybar -q auxhome -c /home/pvetere/.config/polybar/config.ini &
fi

bspc config -m eDP-1 top_padding 0
bspc config -m eDP-1 bottom_padding 26
polybar -q main -c /home/pvetere/.config/polybar/config.ini &

