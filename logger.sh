#!/bin/bash
clear
myPid=$(pidof stationRpi)
while sleep 1; do
    tput cup 0 0
    tail /proc/$myPid/fd/1
done
