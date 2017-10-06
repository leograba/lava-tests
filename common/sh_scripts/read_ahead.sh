#!/bin/sh

set -x

case $1 in
	apalis-imx6) MMC=1024 ; SD=512 ; MMC_MOUNT=mmcblk0 ; SD_MOUNT=mmcblk1 ;;
	apalis-t30) MMC=4096 ; SD=1024 ; MMC_MOUNT=mmcblk0 ; SD_MOUNT=mmcblk1 ;;
	apalis-tk1) MMC=4096 ; SD=1024 ; MMC_MOUNT=mmcblk0 ; SD_MOUNT=mmcblk1 ;;
	colibri-imx6) MMC=1024 ; SD=512 ; MMC_MOUNT=mmcblk0 ; SD_MOUNT=mmcblk1  ;;
	colibri-imx6ull) MMC=0 ; SD=0 ; MMC_MOUNT= ; SD_MOUNT= ;;
	colibri-imx7) MMC=0 ; SD=0 ; MMC_MOUNT= ; SD_MOUNT= ;;
	colibri-imx7-1gb) MMC=0 ; SD=0 ; MMC_MOUNT= ; SD_MOUNT= ;;
	colibri-t30) MMC=2048 ; SD=1024 ; MMC_MOUNT=mmcblk0 ; SD_MOUNT=mmcblk1  ;;
	colibri-t20) MMC=0 ; SD=0 ; MMC_MOUNT= ; SD_MOUNT= ;;
	colibri-vf) MMC=0 ; SD=0 ; MMC_MOUNT= ; SD_MOUNT= ;;
	*) exit 1 ;;
esac

# MMC

if [ $MMC -eq 0 ] ; then
	:
else
	if [ -d /sys/block/${MMC_MOUNT} ] ; then
		lava-test-case mmc-exist --result pass
	else lava-test-case mmc-exist --result fail
	fi

	if [ `cat /sys/block/${MMC_MOUNT}/queue/read_ahead_kb` -ne ${MMC} ] ; then
		lava-test-case mmc-read-ahead-size --result fail
	else lava-test-case mmc-read-ahead-size --result pass --measurement ${MMC}
	fi
fi

# SD card

if [ $SD -eq 0 ] ; then
	:
else
	if [ -d /sys/block/${SD_MOUNT} ] ; then
		lava-test-case sd-card-exist --result pass
	else lava-test-case sd-card-exist --result fail
	fi

	if [ `cat /sys/block/${SD_MOUNT}/queue/read_ahead_kb` -ne ${SD} ] ; then
		lava-test-case sd-card-read-ahead-size --result fail
	else lava-test-case sd-card-read-ahead-size --result pass --measurement ${SD}
	fi
fi
