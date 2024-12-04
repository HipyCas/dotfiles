CURRENT_BRIGHTNESS="0.`xrandr --verbose --current | grep Brightness: | sed -e 's/.*[^0-9]\([0-9]\+\)[^0-9]*$/\1/'`"
echo `xrandr --verbose --current | grep Brightness: | sed -e 's/.*[^0-9]\([0-9]\+\)[^0-9]*$/\1/'`
echo Obtained brightness $CURRENT_BRIGHTNESS
echo To increase by step $I3_BRIGHTNESS_STEP
[ $I3_BRIGHTNESS_STEP -ge 1 ] && exit 1
NEW_BRIGHTNESS=$(($CURRENT_BRIGHTNESS + $I3_BRIGHTNESS_STEP))
echo New brightness $NEW_BRIGHTNESS
[ $NEW_BRIGHTNESS -lt 100 ] && xrandr --output eDP-1 --brightness 0.${NEW_BRIGHTNESS}
