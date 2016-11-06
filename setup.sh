#!/bin/bash

sudo echo -n

sudo echo EZTVUSER=eztv >> /etc/environment
sudo echo REPO="/home/eztv/EZTV/" >> /etc/environment
export EZTVUSER=eztv
export REPO="/home/eztv/EZTV/"

mkdir ~/drive

sudo apt-add-repository ppa:obsproject/obs-studio -y

sudo apt-get update
sudo apt-get install -y htop build-essential libpcre3 libpcre3-dev libssl-dev vim git ruby ruby-dev ffmpeg obs-studio

sudo ubuntu-drivers autoinstall


sudo cp $REPO/eztv-control.service /lib/systemd/system/
sudo systemctl enable eztv-control

mkdir ~/.config/autostart
cp $REPO/*.desktop ~/.config/autostart/


sudo gem install httparty sinatra thin --no-ri --no-rdoc
sudo gem install faye -v 1.2.2 --no-ri --no-rdoc #until they fix https://github.com/faye/faye/issues/452

mkdir nginx-build
cd nginx-build

wget http://nginx.org/download/nginx-1.11.5.tar.gz -O nginx.tar.gz
tar -xf nginx.tar.gz

wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
unzip master.zip

cd nginx-1.11.5
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
make && sudo make install

sudo cp $REPO/nginx.conf /usr/local/nginx/conf
sudo cp $REPO/stat.xsl /usr/local/nginx/html
sudo cp $REPO/nginx.service /lib/systemd/system/
sudo systemctl enable nginx

rm -rf nginx-build


sudo cp $REPO/udevrule /etc/udev/rules.d/10-usbscript.rules
sudo cp $REPO/usbdevinserted /usr/bin/

sudo udevadm control --reload-rules
