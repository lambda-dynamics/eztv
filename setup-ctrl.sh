#!/bin/bash

cp $REPO/eztv-control.service /lib/systemd/system/
systemctl enable eztv-control

cp $REPO/*.desktop ~/.config/autostart/
