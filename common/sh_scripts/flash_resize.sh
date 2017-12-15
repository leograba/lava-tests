#!/bin/sh

set -x

if [ -z $1 ]; then echo "no module name"; exit 1; fi
source $(echo $1 | tr - _)/resources/flash-resize-threshold-values.sh
if [ $? -ne 0 ]; then echo "wrong module ID or name"; exit 1; fi

df #for debugging purposes

if [ "$TYPE" -eq 1 ]; then
	FLASH_SIZE=$(df | grep "/dev/root" | awk '{ print $2 "\t"}')
else if "$TYPE" -eq 2 ]; then
	FLASH_SIZE=$(df | grep "ubi" | awk '{ print $2 "\t"}')
fi

if [ -z "$FLASH_SIZE"]; then
	lava-test-case flash-partition-exist --result fail
else
	lava-test-case flash-partition-exist --result pass
	if [ "$FLASH_SIZE" -lt "$FLASH_SIZE_MIN" ] || [ "$FLASH_SIZE" -gt "$FLASH_SIZE_MAX" ]; then
	    lava-test-case flash-partition-size --result fail
	else
	    lava-test-case flash-partition-size --result pass --measurement ${FLASH_SIZE}
	fi
fi

