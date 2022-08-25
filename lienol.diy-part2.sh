#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vss
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/lean/luci-app-jd-dailybonus
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
#git clone https://github.com/liuran001/openwrt-packages.git package/liuran001-package
git clone https://github.com/coolsnowwolf/lede.git /tmp/lede
# cp -R /tmp/lede/package/lean/vsftpd-alt/ /home/runner/work/lean-lienol.openwrt/lean-lienol.openwrt/openwrt/package/lean/vsftpd-alt
# cp -R /tmp/lede/package/lean/luci-app-vsftpd/ /home/runner/work/lean-lienol.openwrt/lean-lienol.openwrt/openwrt/package/lean/luci-app-vsftpd
#git clone https://github.com/tianiue/luci-app-bypass.git package/lean/luci-app-bypass
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull --depth 1 origin master
git branch --set-upstream-to=origin/master master
