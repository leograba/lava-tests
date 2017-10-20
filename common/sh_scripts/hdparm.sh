#!/bin/sh

set -x

case $1 in
	apalis-imx6)
		MMC=1024 ; SD1=512 ; SD2=512
		MMC_MOUNT=mmcblk0 ; SD1_MOUNT=mmcblk1 ; SD2_MOUNT=mmcblk2 ;;
	apalis-t30)
		MMC=4096 ; SD1=1024 ; SD2=512
		MMC_MOUNT=mmcblk0 ; SD1_MOUNT=mmcblk1 ; SD2_MOUNT=mmcblk2 ;;
	apalis-tk1)
		MMC=4096 ; SD1=1024 ; SD2=512
		MMC_MOUNT=mmcblk0 ; SD1_MOUNT=mmcblk1 ; SD2_MOUNT=mmcblk2 ;;
	colibri-imx6)
		MMC=1024 ; SD1=512 ; SD2=0
		MMC_MOUNT=mmcblk0 ; SD1_MOUNT=mmcblk1 ; SD2_MOUNT=  ;;
	colibri-imx6ull)
		MMC=0 ; SD1=0 ; SD2=0
		MMC_MOUNT= ; SD1_MOUNT= ; SD2_MOUNT= ;;
	colibri-imx7)
		MMC=0 ; SD1=0 ; SD2=0
		MMC_MOUNT= ; SD1_MOUNT= ; SD2_MOUNT= ;;
	colibri-imx7-1gb)
		MMC=0 ; SD1=0 ; SD2=0
		MMC_MOUNT= ; SD1_MOUNT= ; SD2_MOUNT= ;;
	colibri-t30)
		MMC=2048 ; SD1=1024 ; SD2=0
		MMC_MOUNT=mmcblk0 ; SD1_MOUNT=mmcblk1 ; SD2_MOUNT=  ;;
	colibri-t20)
		MMC=0 ; SD1=0 ; SD2=0
		MMC_MOUNT= ; SD1_MOUNT= ; SD2_MOUNT= ;;
	colibri-vf)
		MMC=0 ; SD1=0 ; SD2=0
		MMC_MOUNT= ; SD1_MOUNT= ; SD2_MOUNT= ;;
	*) exit 1 ;;
esac

# MMC

if [ $MMC -eq 0 ] ; then
	:
else
	if [ -d /sys/block/${MMC_MOUNT} ] ; then
		lava-test-case mmc-exist --result pass

		if [ `cat /sys/block/${MMC_MOUNT}/queue/read_ahead_kb` -ne ${MMC} ] ; then
			lava-test-case mmc-read-ahead-size --result fail
		else lava-test-case mmc-read-ahead-size --result pass --measurement ${MMC}
		fi

	else lava-test-case mmc-exist --result fail
	fi
fi

# SD card 1

if [ $SD1 -eq 0 ] ; then
	:
else
	if [ -d /sys/block/${SD1_MOUNT} ] ; then
		lava-test-case sd-card1-exist --result pass

		if [ `cat /sys/block/${SD1_MOUNT}/queue/read_ahead_kb` -ne ${SD1} ] ; then
			lava-test-case sd-card1-read-ahead-size --result fail
		else lava-test-case sd-card1-read-ahead-size --result pass --measurement ${SD1}
		fi

	else lava-test-case sd-card1-exist --result fail
	fi
fi

# SD card 2

if [ $SD2 -eq 0 ] ; then
	:
else
	if [ -d /sys/block/${SD2_MOUNT} ] ; then
		lava-test-case sd-card2-exist --result pass

		if [ `cat /sys/block/${SD2_MOUNT}/queue/read_ahead_kb` -ne ${SD2} ] ; then
			lava-test-case sd-card2-read-ahead-size --result fail
		else lava-test-case sd-card2-read-ahead-size --result pass --measurement ${SD2}
		fi

	else lava-test-case sd-card2-exist --result fail
	fi
fi
