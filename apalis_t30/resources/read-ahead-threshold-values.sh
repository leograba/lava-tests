#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Same values for all Apalis T30

	# apalis T30 1GB
	0026)	export MMC=4096 ; export SD1=1024 ; SD2=512
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;
	# apalis T30 1GB IT
	0031)	export MMC=4096 ; export SD1=1024 ; export SD2=512
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;
	# apalis T30 2GB
	0025)	export MMC=4096 ; export SD1=1024 ; export SD2=512
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;

	*) false ;
esac
