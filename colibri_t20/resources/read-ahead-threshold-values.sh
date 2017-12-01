#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Only raw nand for Colibri T20

	# colibri T20 256MB
	0020)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri T20 256MB IT
	0024)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri T20 512MB
	0021)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri T20 512MB IT
	0022)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;

	*) false ;
esac
