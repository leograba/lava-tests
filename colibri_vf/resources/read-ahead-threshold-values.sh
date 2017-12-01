#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Colibri VF only have raw nand

	# colibri VF61 256MB IT
	0012)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri VF50 128MB
	0010)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;
	# colibri VF50 128MB IT
	0013)	export MMC=0 ; export SD1=128 ; export SD2=0
			export MMC_MOUNT= ; export SD1_MOUNT=mmcblk0 ; export SD2_MOUNT= ;;

	*) false ;
esac
