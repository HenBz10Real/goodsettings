$AXFUN
echo ""
status=$(pgrep -f gsctx) >/dev/null 2>&1
if [ "$status" ]; then
  pkill -f gsctx
  rm /data/local/tmp/gsctx32 >/dev/null 2>&1
  rm /data/local/tmp/gsctx64 >/dev/null 2>&1
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
