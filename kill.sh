$AXFUN
echo ""
status=$(pgrep -f good) >/dev/null 2>&1
if [ "$status" ]; then
  pkill -f good
fi

status=$(pgrep -f good) >/dev/null 2>&1
if [ ! "$status" ]; then
  echo ""
  echo " Goodsettings stopped in background."
  echo ""
else
  echo ""
  echo " Goodsettings failed to stop."
  echo ""
fi
echo ""
