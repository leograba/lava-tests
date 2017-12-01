#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Same values for all Apalis iMX6

	# apalis iMX6Q 2GB IT
	0028)   export MMC=1024 ; export SD1=512 ; export SD2=512
            export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;
	# apalis iMX6Q 1GB
	0027)   export MMC=1024 ; export SD1=512 ; export SD2=512
            export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;
	# apalis iMX6D 1Gb IT
	0035)   export MMC=1024 ; export SD1=512 ; export SD2=512
            export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;
	# apalis iMX6D 512MB
	0029)   export MMC=1024 ; export SD1=512 ; export SD2=512
            export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT=mmcblk2 ;;

	*) false ;
esac
