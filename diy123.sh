#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
# sed 特殊符号转义：. * [ ] ^ $ { } \ + ? | ( )
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
# Modify hostname
sed -i 's/OpenWrt/LinkSSR/g' package/base-files/files/bin/config_generate
# Modify password
sed -i 's/root::0:0:99999:7:::/root:\$1\$5IJBucpD\$Pq2tUZUM9KvFrW6\/zNynf\/:0:0:99999:7:::/g' package/base-files/files/etc/shadow ##密码 admin
# Modify wifi
# sed -i 's/OpenWrt/PDCN/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/default_radio\${devidx}.encryption=psk2/a default_radio\$\{devidx\}.key=1234567890' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/default_radio\${devidx}.ssid=OpenWrt/default_radio0.ssid=PDCN_5G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/default_radio0.ssid=PDCN_5G/a default_radio1.ssid=PDCN' package/kernel/mac80211/files/lib/wifi/mac80211.sh

