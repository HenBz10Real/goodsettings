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
calculate_checksum() {
    local file="/sdcard/AxeronModules/goodsettings/bin/gsctx64"
    sha256sum "$file" | awk '{print $1}'
}

verify_checksum() {
    local expected_checksum="cb97d4ecaf91153ff65c7111bb139bb00a78f7eedbca153edcc0d27df5f1e6f6"

    local actual_checksum
    actual_checksum=$(calculate_checksum "$file")

    if [ "$actual_checksum" == "$expected_checksum" ]; then
        echo
        echo "Checksum verifikasi berhasil untuk file"
        echo
        return 0
    else
        echo
        echo "Checksum verifikasi gagal untuk file"
        echo 
        exit 1
    fi
}
verify_checksum
        echo ""
        sleep 1
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
calculate_checksum() {
    local file="/sdcard/AxeronModules/goodsettings/bin/gsctx32"
    sha256sum "$file" | awk '{print $1}'
}

verify_checksum() {
    local file="/sdcard/AxeronModules/goodsettings/bin/gsctx64"
    local expected_checksum="8b3071d91db57ce82e37ebc0b2b217ea1f355a33c01537b4b9577db139bef815"

    local actual_checksum
    actual_checksum=$(calculate_checksum "$file")

    if [ "$actual_checksum" == "$expected_checksum" ]; then
        echo "Checksum verifikasi berhasil untuk file"
        return 0
    else
        echo "Checksum verifikasi gagal untuk file"
        return 1
    fi
}

verify_checksum
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