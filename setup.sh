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


cp $REPO/eztv-control.service /lib/systemd/system/
systemctl enable eztv-control

mkdir /home/eztv/.config/autostart
cp $REPO/*.desktop /home/eztv/.config/autostart/


gem install httparty sinatra thin --no-ri --no-rdoc
gem install faye -v 1.2.2 --no-ri --no-rdoc #until they fix https://github.com/faye/faye/issues/452

mkdir nginx-build
cd nginx-build

wget http://nginx.org/download/nginx-1.11.5.tar.gz -O nginx.tar.gz
tar -xf nginx.tar.gz

wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
unzip master.zip

cd nginx-1.11.5
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
make && make install

cp $REPO/nginx.conf /usr/local/nginx/conf
cp $REPO/stat.xsl /usr/local/nginx/html
cp $REPO/nginx.service /lib/systemd/system/
systemctl enable nginx

rm -rf nginx-build


cp $REPO/udevrule /etc/udev/rules.d/10-usbscript.rules
cp $REPO/usbdevinserted /usr/bin/

udevadm control --reload-rules
