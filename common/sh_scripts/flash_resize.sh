#!/bin/sh

set -x

case $1 in
# The boudaries specified here need to be checked for each module
# TYPE 1-eMMC 2-raw NAND
	apalis-imx6)
		FLASH_SIZE_MIN=3000000 ; FLASH_SIZE_MAX=4000000 ; TYPE=1 ;;
	apalis-t30-1gb)
		FLASH_SIZE_MIN=3000000 ; FLASH_SIZE_MAX=4000000 ; TYPE=1 ;;
	apalis-t30-2gb)
		FLASH_SIZE_MIN=7000000 ; FLASH_SIZE_MAX=8000000 ; TYPE=1 ;;
	apalis-tk1)
		FLASH_SIZE_MIN=15000000 ; FLASH_SIZE_MAX=16000000 ; TYPE=1 ;;
	colibri-imx6)
		FLASH_SIZE_MIN=3000000 ; FLASH_SIZE_MAX=4000000 ; TYPE=1 ;;
	colibri-imx6ull-256mb)
		FLASH_SIZE_MIN=100000 ; FLASH_SIZE_MAX=130000 ; TYPE=2 ;;
	colibri-imx6ull-512mb)
		FLASH_SIZE_MIN=450000 ; FLASH_SIZE_MAX=550000 ; TYPE=2 ;;
	colibri-imx7)
		FLASH_SIZE_MIN=450000 ; FLASH_SIZE_MAX=550000 ; TYPE=2 ;;
	colibri-imx7-1gb)
		FLASH_SIZE_MIN=3000000 ; FLASH_SIZE_MAX=4000000 ; TYPE=1 ;;
	colibri-t30)
		FLASH_SIZE_MIN=3000000 ; FLASH_SIZE_MAX=4000000 ; TYPE=1 ;;
	colibri-t20-256mb)
		FLASH_SIZE_MIN=450000 ; FLASH_SIZE_MAX=550000 ; TYPE=2 ;;
	colibri-t20-512mb)
		FLASH_SIZE_MIN=900000 ; FLASH_SIZE_MAX=1100000 ; TYPE=2 ;;
	colibri-vf-50)
		FLASH_SIZE_MIN=100000 ; FLASH_SIZE_MAX=130000 ; TYPE=2 ;;
	colibri-vf-61)
		FLASH_SIZE_MIN=450000 ; FLASH_SIZE_MAX=550000 ; TYPE=2 ;;
	*) exit 1 ;;
esac

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

