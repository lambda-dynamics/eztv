#!/bin/bash
echo EZTVUSER=eztv >> /etc/environment
echo REPO="/home/eztv/EZTV/" >> /etc/environment
export EZTVUSER=eztv
export REPO="/home/eztv/EZTV/"

mkdir ~/drive

apt-add-repository ppa:obsproject/obs-studio -y

apt-get update
apt-get install -y htop build-essential libpcre3 libpcre3-dev libssl-dev vim git ruby ruby-dev ffmpeg obs-studio

ubuntu-drivers autoinstall
