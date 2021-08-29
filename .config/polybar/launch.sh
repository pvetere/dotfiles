#!/bin/env sh

pkill polybar

sleep 1

polybar -q main -c /home/pvetere/.config/polybar/config.ini &
polybar -q aux -c /home/pvetere/.config/polybar/config.ini &

