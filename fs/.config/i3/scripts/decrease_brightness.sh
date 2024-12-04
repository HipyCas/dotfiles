CURRENT_BRIGHTNESS=`xrandr --verbose --current | grep Brightness: | sed -e 's/.*[^0-9]\([0-9]\+\)[^0-9]*$/\1/'`
echo `xrandr --verbose --current | grep Brightness: | sed -e 's/.*[^0-9]\([0-9]\+\)[^0-9]*$/\1/'`
echo Obtained brightness $CURRENT_BRIGHTNESS
echo To decrease by step $I3_BRIGHTNESS_STEP
NEW_BRIGHTNESS=$(($CURRENT_BRIGHTNESS - $I3_BRIGHTNESS_STEP))
echo New brightness $NEW_BRIGHTNESS
[ $NEW_BRIGHTNESS -gt 0 ] && xrandr --output eDP-1 --brightness 0.`printf "%02d" ${NEW_BRIGHTNESS}`
