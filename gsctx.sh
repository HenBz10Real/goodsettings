$AXFUN
COLOR_LIGHT_GREEN="\033[0;32m"
COLOR_RED="\e[0;31m"
LK="https://linktr.ee/henvxofficial"
BIN="/data/local/tmp/goodsettings"
URL="https://raw.githubusercontent.com/HenBz10Real/goodsettings/main/bin/god.sh"
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
printf "Version : 4.1"
echo ""

sleep 2
echo ""

am send-trim-memory --user 0 com.android.systemui RUNNING_CRITICAL >/dev/null 2>&1
{ appops set com.lemon.lvoverseas POST_NOTIFICATION deny & } 2>/dev/null

status=$(pgrep -f gsctx) >/dev/null 2>&1
if [ ! "$status" ]; then
	storm -rP "$BIN" -s "${URL}" -fn "gsctx" "$@"
	nohup "$BIN"gsctx >/dev/null 2>&1 &
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
