#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri T30 1GB
	0023)	export MMC=2048 ; export SD1=1024 ; export SD2=0
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=  ;;
	# colibri T30 1GB IT
	0030)	export MMC=2048 ; export SD1=1024 ; export SD2=0
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=  ;;

	*) false ;
esac
