#!/bin/bash
sudo echo EZTVUSER=eztv >> /etc/environment
sudo echo REPO="/home/eztv/EZTV/" >> /etc/environment
export EZTVUSER=eztv
export REPO="/home/eztv/EZTV/"

mkdir ~/drive

sudo apt-add-repository ppa:obsproject/obs-studio -y

sudo apt-get update
sudo apt-get install -y htop build-essential libpcre3 libpcre3-dev libssl-dev vim git ruby ruby-dev ffmpeg obs-studio

sudo ubuntu-drivers autoinstall
