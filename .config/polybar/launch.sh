#!/bin/env bash

LAPMON=eDP-1
FORCE_LAPTOP=0
AUXTOPPAD=25
AUXBOTPAD=0

laptop-mode()
{
    echo "--- Laptop Config ---"
    bspc config -m $LAPMON top_padding     $AUXTOPPAD
    polybar -q auxlap -c /home/pvetere/.config/polybar/config.ini &
}

home-mode()
{
    echo "--- Home Config ---"
    AUXMON=HDMI-1
    bspc config -m $LAPMON top_padding     0
    bspc config -m $AUXMON top_padding     $AUXTOPPAD
    bspc config -m $AUXMON bottom_padding  $AUXBOTPAD
    polybar -q auxhome -c /home/pvetere/.config/polybar/config.ini &
}

work-mode()
{
    echo "--- Work Config ---"
    AUXMON1=DP-3-1
    AUXMON2=DP-3-2
    bspc config -m $LAPMON  top_padding    0
    bspc config -m $AUXMON1 top_padding    $AUXTOPPAD
    bspc config -m $AUXMON2 top_padding    $AUXTOPPAD
    bspc config -m $AUXMON1 bottom_padding $AUXBOTPAD
    bspc config -m $AUXMON2 bottom_padding $AUXBOTPAD
    polybar -q auxwork1 -c /home/pvetere/.config/polybar/config.ini &
    polybar -q auxwork2 -c /home/pvetere/.config/polybar/config.ini &
}

if [ "$1" == "--force-laptop" ] ; then
    FORCE_LAPTOP=1
fi

pkill polybar
sleep 1

if [ $FORCE_LAPTOP -eq 1 ] ; then
    laptop-mode
else
    CFGTYPE=$(~/bin/get-desktop-cfg)
    if [ $? -ne 0 ] ; then
        echo "Unknown configuration.  Can't update polybar."
        exit 1
    fi

    case "$CFGTYPE" in
        WORK) work-mode   ;;
        HOME) home-mode   ;;
        *)    laptop-mode ;;
    esac
fi

bspc config -m $LAPMON bottom_padding 26
polybar -q main -c /home/pvetere/.config/polybar/config.ini &

