#!/bin/sh

Font_Red="\033[31m";
Font_Green="\033[32m";
Font_Suffix="\033[0m";

#更换安装源
echo -e "src/gz kiddin9 https://dl.openwrt.ai/packages-23.05/x86_64/" | tee -a /etc/opkg/distfeeds.conf && 
sed -i 's/^option check_signature/#&/' /etc/opkg.conf && 
opkg update && 


#安装ssrp
opkg install luci-app-ssr-plus --force-overwrite --force-maintainer  

#安装passwall
opkg install luci-app-passwall --force-overwrite --force-maintainer 

#安装openclash
opkg install luci-app-openclash --force-overwrite --force-maintainer  

#安装NPS客户端
opkg install luci-app-nps --force-overwrite --force-maintainer 

#安装zerotier
opkg luci-app-zerotier  --force-overwrite --force-maintainer  

安装adguardhome
opkg install luci-app-adguardhome --force-overwrite --force-maintainer 

#清除缓存
rm -rf /tmp/luci-indexcache* /tmp/luci-modulecache/* && 

clear
echo -n -e "${Font_Green}安装成功，5秒后重启${Font_Suffix}"
sleep 5
rm istoreos.sh -rf
reboot
