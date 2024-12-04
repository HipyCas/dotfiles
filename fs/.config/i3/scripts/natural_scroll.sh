id=`xinput list | grep -i "PNP0C50:00 04F3:311D Touchpad" | cut -d'=' -f2 | cut -d'[' -f1`
echo "Mouse ID $id"

natural_scrolling_id=`xinput list-props ${id} | \
                      grep -i "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`

echo "Natural scrolling ID ${natural_scrolling_id} (${id})"

xinput --set-prop $id ${natural_scrolling_id} 1
