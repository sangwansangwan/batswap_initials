#!/bin/bash

process_name="stationRpi"
chmod +x stationRpi
script_path = ''  # provide the name of the folder

check_process() {
    local process_count=$(ps aux | grep "$process_name" | wc -l)
	

    if [ "$process_count" -gt 2 ]; then
        echo "Process swapping is running." $process_count
	    sudo  pkill -f "$process_name"
    fi
    if [ "$process_count" -lt 2 ]; then
	    echo "Process started..."
        $script_path/stationRpi -oid electrifuel -sid 21 -rid 18 -p 2 >> $script_path/log.txt 2>&1 &
	xdotool key ctrl+r
    fi
}

while true; do
    check_process
    sleep 25
done
local
