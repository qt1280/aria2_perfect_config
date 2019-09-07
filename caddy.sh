#!/bin/bash
yum -y update 
yum -y install epel-release
yum -y install wget git unzip gcc gcc-c++ openssl-devel 
cd /root/
wget -N --no-check-certificate https://raw.githubusercontent.com/qt1280/aria2.sh/master/aria2.sh && chmod +x aria2.sh && bash aria2.sh
mkdir -p /data/www/ariang
cd  /data/www/ariang
wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip && unzip master.zip
mv AriaNg-DailyBuild-master/* .
rm -rf master.zip AriaNg-DailyBuild-master
curl https://rclone.org/install.sh | sudo bash
yum -y install  fuse
rclone config
cd /root/
wget -N --no-check-certificate https://raw.githubusercontent.com/qt1280/doubi/master/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh


