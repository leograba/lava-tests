#!/bin/sh

set -x

if [ -z $1 ]; then echo "no module name"; exit 1; fi
source $1/resources/nbench-threshold-values.sh
if [ $? -ne 0 ]; then echo "wrong module ID or name"; exit 1; fi

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

