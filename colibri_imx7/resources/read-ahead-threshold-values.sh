#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Values not specified yet for iMX7D 1GB

	# colibri iMX7S 256MB
	0032)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri iMX7D 512MB
	0033)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri iMX7D 1GB
	0039)	export MMC=128 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT=mmcblk0 ; export SD1_MOUNT=mmcblk1 ; export SD2_MOUNT= ;;

	*) false ;
esac
