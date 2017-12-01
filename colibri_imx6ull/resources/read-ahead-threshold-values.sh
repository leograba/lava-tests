#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# iMX6ULL only have raw nand

	# colibri iMX6ULL 256MB
	0036)	export MMC=0 ; export SD1=1 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri iMX6ULL 512MB WiFi/BL IT
	0040)	export MMC=0 ; export SD1=1 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;

	*) false ;
esac
