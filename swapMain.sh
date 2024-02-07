#!/bin/bash

process_name="stationRpi"
chmod +x stationRpi

# Provide the name of the variables down below --------------
script_path='.'         # absolute path where script is located
stationId=21             
rackId=18               
organisationId="electrifuel"
portNumber=1
#--------------------------------------------------------------



#------------------- Do not edit below this part ----------------------
current_date=$(date +'%Y-%m-%d')

logs_dir="$script_path/logs"
mkdir -p "$logs_dir"

log_file="$logs_dir/log_$current_date.txt"

check_process() {
    local process_count=$(ps aux | grep "$process_name" | wc -l)

    if [ "$process_count" -gt 2 ]; then
        echo "Process swapping is already running." $process_count
        sudo pkill -f "$process_name"
    fi

    if [ "$process_count" -lt 2 ]; then
        echo "Process started..."
        $script_path/stationRpi -oid ${organisationId} -sid ${stationId} -rid ${rackId} -p ${portNumber} >> "$log_file" 2>&1 &
    fi
}

while true; do
    check_process
    sleep 25
done
#------------------- Do not edit above this part ----------------------

