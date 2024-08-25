$AXFUN
echo ""
status=$(pgrep -f gsctx) >/dev/null 2>&1
if [ "$status" ]; then
  pkill -f gsctx
fi

status=$(pgrep -f gsctx) >/dev/null 2>&1
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
