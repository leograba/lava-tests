#!/bin/sh

set -x

case $1 in
	# Should complete this table, dummy values currently
	apalis-imx6)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	apalis-t30)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	apalis-tk1)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	colibri-imx6)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	colibri-imx6ull)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	colibri-imx7)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	colibri-imx7-1gb)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	colibri-t30)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	colibri-t20)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	colibri-vf)
		ORIG_BYTEMARK_INT_MIN=0 ; ORIG_BYTEMARK_INT_MAX=10000 
		ORIG_BYTEMARK_FP_MIN=0 ; ORIG_BYTEMARK_FP_MAX=10000
		LINUX_DATA_INT_MIN=0 ; LINUX_DATA_INT_MAX=10000
		LINUX_DATA_FP_MIN=0 ; LINUX_DATA_FP_MAX=10000;;
	*) exit 1 ;;
esac

LOG=$2
ORIG_BYTEMARK_INT=`cat nbench.log | grep "INTEGER" | cut -d':' -f2 | cut -d$'\n' -f1 | cut -d '.' -f 1`
ORIG_BYTEMARK_FP=`cat nbench.log | grep "FLOAT" | cut -d':' -f2 | cut -d$'\n' -f1 | cut -d '.' -f 1`
LINUX_DATA_INT=`cat nbench.log | grep "INTEGER" | cut -d':' -f2 | cut -d$'\n' -f2 | cut -d '.' -f 1`
LINUX_DATA_FP=`cat nbench.log | grep "FLOAT" | cut -d':' -f2 | cut -d$'\n' -f2 | cut -d '.' -f 1`

if [ "$ORIG_BYTEMARK_INT" -lt "$ORIG_BYTEMARK_INT_MIN" ] || [ "$ORIG_BYTEMARK_INT" -gt "$ORIG_BYTEMARK_INT_MAX" ]; then
	lava-test-case nbench-result-orig-bytemark-int --result fail
else
	lava-test-case nbench-result-orig-bytemark-int --result pass --measurement ${ORIG_BYTEMARK_INT}
fi

if [ "$ORIG_BYTEMARK_FP" -lt "$ORIG_BYTEMARK_FP_MIN" ] || [ "$ORIG_BYTEMARK_FP" -gt "$ORIG_BYTEMARK_FP_MAX" ]; then
	lava-test-case nbench-result-orig-bytemark-fp --result fail
else
	lava-test-case nbench-result-orig-bytemark-fp --result pass --measurement ${ORIG_BYTEMARK_FP}
fi

if [ "$LINUX_DATA_INT" -lt "$LINUX_DATA_INT_MIN" ] || [ "$LINUX_DATA_INT" -gt "$LINUX_DATA_INT_MAX" ]; then
	lava-test-case nbench-result-linux-data-int --result fail
else
	lava-test-case nbench-result-linux-data-int --result pass --measurement ${LINUX_DATA_INT}
fi

if [ "$LINUX_DATA_FP" -lt "$LINUX_DATA_FP_MIN" ] || [ "$LINUX_DATA_FP" -gt "$LINUX_DATA_FP_MAX" ]; then
	lava-test-case nbench-result-linux-data-fp --result fail
else
	lava-test-case nbench-result-linux-data-fp --result pass --measurement ${LINUX_DATA_FP}
fi

