#!/bin/sh

set -x

if [ -z $1 ]; then echo "no module name"; exit 1; fi
source $(echo $1 | tr - _)/resources/read-ahead-threshold-values.sh
if [ $? -ne 0 ]; then echo "wrong module ID or name"; exit 1; fi

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
