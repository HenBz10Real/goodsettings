#!/bin/sh
source $FUNCTION
architecture=$(getprop ro.product.cpu.abi)
COLOR_LIGHT_GREEN="\033[0;32m"
COLOR_RED="\e[0;31m"
LK="https://linktr.ee/henvxofficial"
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
if [ "$architecture" = "arm64-v8a" ]; then
		echo ""
		echo "
█▀▀ █▀█ █▀█ █▀▄ █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
█▄█ █▄█ █▄█ █▄▀ ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█"
		echo ""

		sleep 2

		printf "GOODSETTINGS CORTEX - $architecture"
		echo ""

		sleep 2
		echo ""
		
		am send-trim-memory --user 0 com.android.systemui RUNNING_CRITICAL >/dev/null 2>&1
		
		status=$(pgrep -f gsctx64) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "/sdcard/AxeronModules/goodsettings/bin/gsctx64" /data/local/tmp
			chmod +x /data/local/tmp/gsctx64
			nohup /data/local/tmp/gsctx64 >/dev/null 2>&1 &
		fi
		
		sleep 2
		
		status=$(pgrep -f gsctx64) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "INFORMATION | ${COLOR_LIGHT_GREEN}running in the background."
		else
			echo "INFORMATION | ${COLOR_RED}failed running. "
		fi
		sleep 3
		echo ""
		echo ""
		
elif [ "$architecture" = "armeabi-v7a" ]; then
		echo ""
		echo "
█▀▀ █▀█ █▀█ █▀▄ █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
█▄█ █▄█ █▄█ █▄▀ ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█"
		echo ""

		sleep 2

		printf "GOODSETTINGS CORTEX - $architecture"
		echo ""

		sleep 2
		echo ""
		
		am send-trim-memory --user 0 com.android.systemui RUNNING_CRITICAL >/dev/null 2>&1
		
		status=$(pgrep -f gsctx32) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "/sdcard/AxeronModules/goodsettings/bin/gsctx32" /data/local/tmp
			chmod +x /data/local/tmp/gsctx32
			nohup /data/local/tmp/gsctx32 >/dev/null 2>&1 &
		fi
		
		sleep 2
		
		status=$(pgrep -f gsctx32) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "INFORMATION | ${COLOR_LIGHT_GREEN}running in the background."
		else
			echo "INFORMATION | ${COLOR_RED}failed running. "
		fi
		sleep 3
		echo ""
		echo ""
	else
	    echo 
		echx "Unknown: $architecture"
		echo
	fi