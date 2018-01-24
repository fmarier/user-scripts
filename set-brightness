#!/bin/sh
case $1 in
    -|+) ;;
    *) exit 1;;
esac

dev="/sys/class/backlight/intel_backlight"
max=$(cat "$dev/max_brightness")
cur=$(cat "$dev/brightness")
step=$(($max / 10))

brightness=$(($cur $1 $step))

if [ "$brightness" -lt 0 ] ; then
    brightness=0
fi
if [ "$brightness" -gt "$max" ] ; then
    brightness="$max"
fi

echo "$brightness" | sudo /usr/bin/tee "$dev/brightness"
