#
#!/bin/bash
# © 2022 GitHub, Inc.
#====================================================================
# Copyright (c) 2023 Arthur
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/Arthur97172/OpenWrt_Build
# File name: diy.sh
# Description: OpenWrt DIY script
#====================================================================

repo=${1:-openwrt}
owner=${2:-Arthur}

echo "OpenWrt DIY script"

echo "repo: ${repo}; owner: ${owner};"

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# Modify hostname
#sed -i 's/OpenWrt/OpenWrting/g' package/base-files/files/bin/config_generate

# Modify timezone
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Modify banner
if [ "${owner}" == "Arthur" ]; then
  if [ "${repo}" == "immort" ]; then
    cat >package/base-files/files/etc/banner <<EOF
 ██████╗ ██████╗ ███████╗███╗   ██╗██╗    ██╗██████╗ ████████╗
██╔═══██╗██╔══██╗██╔════╝████╗  ██║██║    ██║██╔══██╗╚══██╔══╝
██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║ █╗ ██║██████╔╝   ██║   
██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║███╗██║██╔══██╗   ██║   
╚██████╔╝██║     ███████╗██║ ╚████║╚███╔███╔╝██║  ██║   ██║   
 ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   
  -------------------------------------------
  		%D %V, %C       Created By ${owner} 
  -------------------------------------------

EOF
  else
    cat >package/base-files/files/etc/banner <<EOF
██╗███╗   ███╗███╗   ███╗ ██████╗ ██████╗ ████████╗ █████╗ ██╗     ██╗    ██╗██████╗ ████████╗
██║████╗ ████║████╗ ████║██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║     ██║    ██║██╔══██╗╚══██╔══╝
██║██╔████╔██║██╔████╔██║██║   ██║██████╔╝   ██║   ███████║██║     ██║ █╗ ██║██████╔╝   ██║  
██║██║╚██╔╝██║██║╚██╔╝██║██║   ██║██╔══██╗   ██║   ██╔══██║██║     ██║███╗██║██╔══██╗   ██║   
██║██║ ╚═╝ ██║██║ ╚═╝ ██║╚██████╔╝██║  ██║   ██║   ██║  ██║███████╗╚███╔███╔╝██║  ██║   ██║   
╚═╝╚═╝     ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   
----------------------------------------------------------------------------------------------
  		%D %V, %C       Created By ${owner} 
----------------------------------------------------------------------------------------------

EOF
  fi
else
  cat >package/base-files/files/etc/banner <<EOF
██╗███╗   ███╗███╗   ███╗ ██████╗ ██████╗ ████████╗ █████╗ ██╗     ██╗    ██╗██████╗ ████████╗
██║████╗ ████║████╗ ████║██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║     ██║    ██║██╔══██╗╚══██╔══╝
██║██╔████╔██║██╔████╔██║██║   ██║██████╔╝   ██║   ███████║██║     ██║ █╗ ██║██████╔╝   ██║  
██║██║╚██╔╝██║██║╚██╔╝██║██║   ██║██╔══██╗   ██║   ██╔══██║██║     ██║███╗██║██╔══██╗   ██║   
██║██║ ╚═╝ ██║██║ ╚═╝ ██║╚██████╔╝██║  ██║   ██║   ██║  ██║███████╗╚███╔███╔╝██║  ██║   ██║   
╚═╝╚═╝     ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   
----------------------------------------------------------------------------------------------
  		%D %V, %C       Created By ${owner} 
----------------------------------------------------------------------------------------------

EOF
fi

# immort    ==> ${defaultsettings}
# openwrt ==> feeds/ing/default-settings
defaultsettings=package/emortal/default-settings
[ "${repo}" == "openwrt" ] && language=zh_cn || language=zh_Hans

# Set default language
#sed -i "s/en/${language}/g" ${defaultsettings}/files/99-default-settings
#sed -i "s/en/${language}/g" package/luci/modules/luci-base/root/etc/uci-defaults/luci-base
#sed -i "s/+@LUCI_LANG_en/+@LUCI_LANG_${language}/g" ${defaultsettings}/Makefile

# Modify password to Null
sed -i 's/^root:[^:]*:/root::/' package/base-files/files/etc/shadow
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' ${defaultsettings}/files/99-default-settings

# Modify the version number
#sed -i "s/DISTRIB_PUBLISHER /${owner} DISTRIB_D $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/base-files/files/etc/openwrt_release
#sed -i '/DISTRIB_DESCRIPTION=/a DISTRIB_PUBLISHER="Arthur"\nDISTRIB_DATE="'$(TZ=UTC-8 date "+%Y.%m.%d")'"' package/base-files/files/etc/openwrt_release


# Remvoe openwrt_ing
sed -i '/sed -i "s\/# \/\/g" \/etc\/opkg\/distfeeds.conf/a\sed -i "\/openwrt_ing\/d" \/etc\/opkg\/distfeeds.conf' ${defaultsettings}/files/99-default-settings

# Modify network setting
sed -i '$i uci set network.lan.list ports="eth1"' ${defaultsettings}/files/99-default-settings
sed -i '$i uci set network.lan.list ports="eth2"' ${defaultsettings}/files/99-default-settings
sed -i '$i uci set network.lan.list ports="eth3"' ${defaultsettings}/files/99-default-settings
sed -i '$i uci set network.lan.list ports="eth4"' ${defaultsettings}/files/99-default-settings
sed -i '$i uci set network.wan.device="eth0"' ${defaultsettings}/files/99-default-settings
sed -i '$i uci set network.wan.ifname="eth0"' ${defaultsettings}/files/99-default-settings
sed -i '$i uci set network.wan.proto=pppoe' ${defaultsettings}/files/99-default-settings
#sed -i '$i uci set network.wan6.ifname="eth0"' ${defaultsettings}/files/99-default-settings
#sed -i '$i uci commit network' ${defaultsettings}/files/99-default-settings

# Modify Default PPPOE Setting
#sed -i '$i uci set network.wan.username=PPPOE_USERNAME' ${defaultsettings}/files/99-default-settings
#sed -i '$i uci set network.wan.password=PPPOE_PASSWD' ${defaultsettings}/files/99-default-settings
#sed -i '$i uci commit network' ${defaultsettings}/files/99-default-settings

# Modify ssid
#sed -i 's/OpenWrt/OpenWrting/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Enable wifi
#sed -i 's/.disabled=1/.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Enable MU-MIMO
#sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify kernel version
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile

# Modify maximum connections
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# Modify default theme
deftheme=bootstrap
if [ "${owner}" == "Leeson" ]; then
  deftheme=bootstrap
elif [ "${owner}" == "Lyc" ]; then
  deftheme=pink
else
  deftheme=argon
fi
echo deftheme: ${deftheme}
sed -i "s/bootstrap/${deftheme}/g" feeds/luci/collections/luci/Makefile
sed -i "s/bootstrap/${deftheme}/g" feeds/luci/modules/luci-base/root/etc/config/luci

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
  echo 'CONFIG_KERNEL_BUILD_USER="${owner}"' >>.config ||
  sed -i "s|\(CONFIG_KERNEL_BUILD_USER=\).*|\1$\"${owner}\"|" .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
  echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
  sed -i 's|\(CONFIG_KERNEL_BUILD_DOMAIN=\).*|\1$"GitHub Actions"|' .config

# Modify kernel and rootfs size
#sed -i 's/CONFIG_TARGET_KERNEL_PARTSIZE=.*$/CONFIG_TARGET_KERNEL_PARTSIZE=64/' .config
#sed -i 's/CONFIG_TARGET_ROOTFS_PARTSIZE=.*$/CONFIG_TARGET_ROOTFS_PARTSIZE=1024/' .config

# Modify app list
#sed -i 's/"vpn"/"services"/g; s/"VPN"/"Services"/g' package/feeds/luci/luci-app-ipsec-server/luasrc/controller/ipsec-server.lua # `grep "IPSec VPN Server" -rl ./`
#sed -i 's/"vpn"/"services"/g; s/"VPN"/"Services"/g' package/feeds/luci/luci-app-ipsec-vpnd/luasrc/controller/ipsec-server.lua   # `grep "IPSec VPN Server" -rl ./`
#sed -i 's/"vpn"/"services"/g; s/"VPN"/"Services"/g' package/feeds/ing/luci-app-zerotier/luasrc/controller/zerotier.lua          # `grep "ZeroTier" -rl ./`

# Modify app name
#sed -i 's/"IPSec VPN 服务器"/"IPSec VPN"/g' package/feeds/luci/luci-app-ipsec-server/po/*/ipsec-server.po # `grep "IPSec VPN 服务器" -rl ./`
#sed -i 's/"IPSec VPN 服务器"/"IPSec VPN"/g' package/feeds/luci/luci-app-ipsec-vpnd/po/*/ipsec.po          # `grep "IPSec VPN 服务器" -rl ./`
#sed -i 's/"挂载 SMB 网络共享"/"挂载 SMB"/g' package/feeds/luci/luci-app-cifs-mount/po/*/cifs.po            # `grep "挂载 SMB 网络共享" -rl ./`
#sed -i 's/"Turbo ACC 网络加速"/"Turbo ACC"/g' package/feeds/luci/luci-app-turboacc/po/*/turboacc.po       # `grep "Turbo ACC 网络加速" -rl ./`
#sed -i 's/"实时流量监测"/"监测"/g' package/feeds/luci/luci-app-wrtbwmon/po/*/wrtbwmon.po                   # `grep "实时流量监测" -rl ./`
#sed -i 's/"Argon 主题设置"/"主题设置"/g' package/feeds/ing/luci-app-argon-config/po/*/argon-config.po      # `grep "Argon 主题设置" -rl ./`

# Info
# luci-app-netdata 1.33.1汉化版 导致 web升级后 报错: /usr/lib/lua/luci/dispatcher.lua:220: /etc/config/luci seems to be corrupt, unable to find section 'main'

# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan-Go
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_IPT2Socks
# CONFIG_PACKAGE_trojan-go  导致 web升级后 报错: /usr/lib/lua/luci/dispatcher.lua:220: /etc/config/luci seems to be corrupt, unable to find section 'main'

# luci-app-beardropper 导致 web升级后 /etc/config/network 信息丢失
