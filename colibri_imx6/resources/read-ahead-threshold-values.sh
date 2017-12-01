#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Same values for all Colibri iMX6

	# colibri iMX6S 256MB
	0014)	export MMC=1024 ; export SD1=512 ; export SD2=0
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=  ;;
	# colibri iMX6S 256MB IT
	0016)	export MMC=1024 ; export SD1=512 ; export SD2=0
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=  ;;
	# colibri iMX6DL 512MB
	0015)	export MMC=1024 ; export SD1=512 ; export SD2=0
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=  ;;
	# colibri iMX6DL 512MB IT
	0017)	export MMC=1024 ; export SD1=512 ; export SD2=0
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=  ;;

	*) false ;
esac
