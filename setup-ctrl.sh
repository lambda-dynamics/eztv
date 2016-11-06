#!/bin/bash

sudo cp $REPO/eztv-control.service /lib/systemd/system/
sudo systemctl enable eztv-control

mkdir ~/.config/autostart
cp $REPO/*.desktop ~/.config/autostart/
