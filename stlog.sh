#!/bin/bash

trap "exit" INT
echo "Started recording at " $(date +"%T") >> /home/obs/reclog.log
while :
do
    echo "Still recording..." >> /home/obs/reclog.log
    sleep 1
done
