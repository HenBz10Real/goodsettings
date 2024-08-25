set_priorities() {
    pid="$1"
    nice -n -5 -p "$pid" > /dev/null 2>&1
    ionice -c 1 -n 0 -p "$pid" > /dev/null 2>&1
    renice -n -1 -p "$pid" > /dev/null 2>&1
    iorenice "$pid" 1 0 > /dev/null 2>&1
}

path_remove() {
    dir_path="$1"
    if [ ! -d "$dir_path" ]; then
        return
    fi

    for entry in "$dir_path"/*; do
        [ -e "$entry" ] || continue
        if [ "$entry" = "$dir_path/." ] || [ "$entry" = "$dir_path/.." ]; then
            continue
        fi
        rm -f "$entry"
    done
}

main() {
    prev_window_state=""
    game_running=""

    cmd notification post -S bigtext -t "GS - Cortex" "Tag" "By:Henpeex Version:4.0"

    while :; do
        clear
        
        exec > /dev/null 2>&1

        buffer=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -Eo "com.dts.freefireth|com.dts.freefiremax")

        if [ -n "$buffer" ]; then
            if [ "$prev_window_state" != "active" ]; then
                game_running="open"
                am broadcast -a axeron.show.TOAST --es title "GS-CTRX" --es msg "GOODSETTINGS ACTIVED" --ei duration "4000"
                sleep 6

                cmd power set-fixed-performance-mode-enabled true
                appops set com.lemon.lvoverseas POST_NOTIFICATION deny

                pgrep -f "com.dts.freefireth|com.dts.freefiremax" | while read -r pid; do
                    set_priorities "$pid"
                    sleep 1
                done

                am broadcast -a axeron.show.TOAST --es title "GS-CTRX" --es msg "SUCCESSFULLY GOODSETTINGS" --ei duration "2000"
            fi
            prev_window_state="active"
        else
            if [ "$game_running" = "open" ]; then
                game_running=""
                am broadcast -a axeron.show.TOAST --es title "GS-CTRX" --es msg "GOODSETTINGS CLOSED" --ei duration "2000"
                cmd power set-fixed-performance-mode-enabled false
                appops set com.lemon.lvoverseas POST_NOTIFICATION allow deny
            fi
            prev_window_state=""
        fi

        sleep 5
    done
}
main
