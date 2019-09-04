#!/bin/bash
yum -y update wget
yum -y install epel-release
yum -y install wget git unzip gcc gcc-c++ openssl-devel nginx
systemctl start nginx
systemctl enable nginx.service
systemctl stop firewalld # 关闭防火墙
wget -N https://raw.githubusercontent.com/qt1280/aria2.sh/master/aria2.sh && chmod +x aria2.sh && bash aria2.sh 

mkdir -p /data/www/ariang
cd /data/www/ariang
wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip && unzip master.zip
mv AriaNg-DailyBuild-master/* .
rm -rf master.zip AriaNg-DailyBuild-master

cd /etc/nginx/conf.d
touch ariang.conf

IP=`curl -s http://ipecho.net/plain`;

echo "server {
    listen 80;
    server_name ${IP};

    location / {
        root   /data/www/ariang;
        index  index.html index.htm;
    }
}" >> ariang.conf



yum -y install unzip fuse

#mkdir -p /data/GoogleDrive
curl https://rclone.org/install.sh | sudo bash

rclone config

cd /root/

systemctl reload nginx

touch codesofun.txt
