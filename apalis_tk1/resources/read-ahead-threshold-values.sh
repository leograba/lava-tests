#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in

	# apalis TK1 2GB
	0034)	export MMC=4096 ; export SD1=1024 ; export SD2=512
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;

	*) false ;
esac
