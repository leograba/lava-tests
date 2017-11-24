#!/bin/sh

set -x

case $1 in
	# Data available is based on tests conducted on BSP 2.7b1 for 
	# the read-ahead tuning. SD card wasn't tested for modules without eMMC
	# 1 - exist; 0 - nonexistent
	apalis-imx6)
		MMC=1 ; MMC_MOUNT=mmcblk0 ; MMC_MIN=78 ; MMC_MAX=82
		SD1=1 ; SD1_MOUNT=mmcblk1 ; SD1_MIN=18 ; SD1_MAX=23
		SD2=1 ; SD2_MOUNT=mmcblk2 ; SD2_MIN=18 ; SD2_MAX=23
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	apalis-t30)
		MMC=1 ; MMC_MOUNT=mmcblk0 ; MMC_MIN=52 ; MMC_MAX=61
		SD1=1 ; SD1_MOUNT=mmcblk1 ; SD1_MIN=16 ; SD1_MAX=20
		SD2=1 ; SD2_MOUNT=mmcblk2 ; SD2_MIN=16 ; SD2_MAX=20;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	apalis-tk1)
		MMC=1 ; MMC_MOUNT=mmcblk0 ; MMC_MIN=76 ; MMC_MAX=80
		SD1=1 ; SD1_MOUNT=mmcblk1 ; SD1_MIN=19 ; SD1_MAX=23
		SD2=1 ; SD2_MOUNT=mmcblk2 ; SD2_MIN=19 ; SD2_MAX=23;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	colibri-imx6)
		MMC=1 ; MMC_MOUNT=mmcblk0 ; MMC_MIN=78 ; MMC_MAX=82
		SD1=1 ; SD1_MOUNT=mmcblk1 ; SD1_MIN=19 ; SD1_MAX=23
		SD2=0 ; SD2_MOUNT= ; SD2_MIN= ; SD2_MAX=;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	colibri-imx6ull)
		MMC=0 ; MMC_MOUNT= ; MMC_MIN= ; MMC_MAX=
		SD1=1 ; SD1_MOUNT=mmcblk0 ; SD1_MIN=16 ; SD1_MAX=23 # must check
		SD2=0 ; SD2_MOUNT= ; SD2_MIN= ; SD2_MAX=;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	colibri-imx7)
		MMC=0 ; MMC_MOUNT= ; MMC_MIN= ; MMC_MAX=
		SD1=1 ; SD1_MOUNT=mmcblk0 ; SD1_MIN=16 ; SD1_MAX=23 # must check
		SD2=0 ; SD2_MOUNT= ; SD2_MIN= ; SD2_MAX=;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	colibri-imx7-1gb)
		MMC=1 ; MMC_MOUNT=mmcblk0 ; MMC_MIN= ; MMC_MAX= #TBD
		SD1=1 ; SD1_MOUNT=mmcblk1 ; SD1_MIN=16 ; SD1_MAX=23 # must check
		SD2=0 ; SD2_MOUNT= ; SD2_MIN= ; SD2_MAX=;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	colibri-t30)
		MMC=1 ; MMC_MOUNT=mmcblk0 ; MMC_MIN=58 ; MMC_MAX=62
		SD1=1 ; SD1_MOUNT=mmcblk1 ; SD1_MIN=16 ; SD1_MAX=20
		SD2=0 ; SD2_MOUNT= ; SD2_MIN= ; SD2_MAX=;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	colibri-t20)
		MMC=0 ; MMC_MOUNT= ; MMC_MIN= ; MMC_MAX=
		SD1=1 ; SD1_MOUNT=mmcblk0 ; SD1_MIN=16 ; SD1_MAX=23 # must check
		SD2=0 ; SD2_MOUNT= ; SD2_MIN= ; SD2_MAX=;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	colibri-vf)
		MMC=0 ; MMC_MOUNT= ; MMC_MIN= ; MMC_MAX=
		SD1=1 ; SD1_MOUNT=mmcblk0 ; SD1_MIN=16 ; SD1_MAX=23 # must check
		SD2=0 ; SD2_MOUNT= ; SD2_MIN= ; SD2_MAX=;;
		USB=1 ; USB_MOUNT=sda1 ; USB_MIN=18 ; USB_MAX=23;;
	*) exit 1 ;;
esac

# Should there be separate tests for lower and upper limits?
# Value is round for comparison

# MMC

if [ $MMC -eq 0 ] ; then
	:
else
	if [ -b /dev/${MMC_MOUNT} ]; then
		lava-test-case mmc-exist --result pass

		MMC_PERF=$(hdparm -t /dev/mmcblk0 | awk '{ print $11 "\t"}' | cut -d '.' -f 1)
		if [ "$MMC_PERF" -lt "$MMC_MIN" ] || [ "$MMC_PERF" -gt "$MMC_MAX" ]; then
			lava-test-case hdparm-result-mmc --result fail
		else
			lava-test-case hdparm-result-mmc --result pass --measurement ${MMC_PERF}
		fi
		
	else lava-test-case mmc-exist --result fail
	fi
fi

# SD card 1

if [ $SD1 -eq 0 ] ; then
	:
else
	if [ -b /dev/${SD1_MOUNT} ]; then
		lava-test-case sd1-exist --result pass

		SD1_PERF=$(hdparm -t /dev/${SD1_MOUNT} | awk '{ print $11 "\t"}')
		if [ "$SD1_PERF" -lt "$SD1_MIN" ] || [ "$SD1_PERF" -gt "$SD1_MAX" ]; then
	    lava-test-case hdparm-result-sd1 --result fail
	else
	    lava-test-case hdparm-result-sd1 --result pass --measurement ${SD1_PERF}
	fi
		
	else lava-test-case sd1-exist --result fail
	fi
fi

# SD card 2

if [ $SD2 -eq 0 ] ; then
	:
else
	if [ -b /dev/${SD2_MOUNT} ]; then
		lava-test-case sd2-exist --result pass

		SD2_PERF=$(hdparm -t /dev/${SD2_MOUNT} | awk '{ print $11 "\t"}')
		if [ "$SD2_PERF" -lt "$SD2_MIN" ] || [ "$SD2_PERF" -gt "$SD2_MAX" ]; then
	    lava-test-case hdparm-result-sd2 --result fail
	else
	    lava-test-case hdparm-result-sd2 --result pass --measurement ${SD2_PERF}
	fi
		
	else lava-test-case sd2-exist --result fail
	fi
fi

# USB mass storage

if [ $USB -eq 0 ] ; then
	:
else
	if [ -b /dev/${USB_MOUNT} ]; then
		lava-test-case usb-stick-exist --result pass

		USB_PERF=$(hdparm -t /dev/${USB_MOUNT} | awk '{ print $11 "\t"}')
		if [ "$USB_PERF" -lt "$USB_MIN" ] || [ "$USB_PERF" -gt "$USB_MAX" ]; then
	    lava-test-case hdparm-result-usb-stick --result fail
	else
	    lava-test-case hdparm-result-usb-stick --result pass --measurement ${USB_PERF}
	fi
		
	else lava-test-case usb-stick-exist --result fail
	fi
fi
