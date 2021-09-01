#!/bin/env sh

pkill polybar

sleep 1

#polybar -q main -c /home/pvetere/.config/polybar/config.ini &
polybar -q main_l -c /home/pvetere/.config/polybar/config.ini &
polybar -q main_c -c /home/pvetere/.config/polybar/config.ini &
polybar -q main_r -c /home/pvetere/.config/polybar/config.ini &

bspc config -m eDP-1 top_padding 0
bspc config -m eDP-1 bottom_padding 30

if ~/bin/is-workmon ; then
    AUXMON=DP-3-1
    AUXBAR=auxwork
else
    AUXBAR=auxwork
    AUXMON=HDMI-1
fi

polybar -q $AUXBAR -c /home/pvetere/.config/polybar/config.ini &
bspc config -m $AUXMON top_padding 25
bspc config -m $AUXMON bottom_padding 0

