#!/bin/sh

set -x

if [ -z $1 ]; then echo "no module name"; exit 1; fi
source $(echo $1 | tr - _)/resources/nbench-threshold-values.sh
if [ $? -ne 0 ]; then echo "wrong module ID or name"; exit 1; fi

# Should there be separate tests for lower and upper limits?
# Value is round for comparison

# MMC

if [ $MMC -eq 0 ] ; then
	:
else
	if [ -b /dev/${MMC_MOUNT} ]; then
		lava-test-case mmc-exist --result pass

		MMC_PERF=$(hdparm -t /dev/mmcblk0 | grep reads | awk '{ print $11}' | cut -d '.' -f 1)
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

		SD1_PERF=$(hdparm -t /dev/${SD1_MOUNT} | grep reads | awk '{ print $11}' | cut -d '.' -f 1)
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

		SD2_PERF=$(hdparm -t /dev/${SD2_MOUNT} | grep reads | awk '{ print $11}' | cut -d '.' -f 1)
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

		USB_PERF=$(hdparm -t /dev/${USB_MOUNT} | grep reads | awk '{ print $11}' | cut -d '.' -f 1)
		if [ "$USB_PERF" -lt "$USB_MIN" ] || [ "$USB_PERF" -gt "$USB_MAX" ]; then
	    lava-test-case hdparm-result-usb-stick --result fail
	else
	    lava-test-case hdparm-result-usb-stick --result pass --measurement ${USB_PERF}
	fi
		
	else lava-test-case usb-stick-exist --result fail
	fi
fi
