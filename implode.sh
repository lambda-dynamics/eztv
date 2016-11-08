#!/bin/bash

service nginx stop
systemctl disable nginx
service eztv-control stop
systemctl disable eztv-control

rm /lib/systemd/system/nginx.service
rm /lib/systemd/system/eztv-control.service

rm /usr/bin/usbdevinserted
rm /etc/udev/rules.d/10-usbscript.rules

rm -rf /usr/local/nginx



rm /home/eztv/.config/autostart/*.desktop

