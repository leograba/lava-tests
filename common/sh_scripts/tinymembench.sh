#!/bin/sh

set -x

if [ -f $2 ]; then
	lava-test-case tinymembench-logfile-exist --result pass

else
	lava-test-case tinymembench-logfile-exist --result fail
fi

if [ -z $1 ]; then echo "no module name"; exit 1; fi
source $1/resources/tinymembench-threshold-values.sh
if [ $? -ne 0 ]; then echo "wrong module ID or name"; exit 1; fi

C_COPY=$(cat tinymembench.log | grep "C copy  " | awk '{print $4}' | cut -d "." -f1)
C_FILL=$(cat tinymembench.log | grep "C fill  " | awk '{print $4}' | cut -d "." -f1)
STD_MEMCPY=$(cat tinymembench.log | grep "standard memcpy" | awk '{print $4}' | cut -d "." -f1)
STD_MEMSET=$(cat tinymembench.log | grep "standard memset" | awk '{print $4}' | cut -d "." -f1)
LATENCY=$(cat tinymembench.log | grep "67108864" | awk '{print $3}' | cut -d "." -f1)

# C copy
if [ "$C_COPY" -lt "$C_COPY_MIN" ] || [ "$C_COPY" -gt "$C_COPY_MAX" ]; then
    lava-test-case tinymembench-c-copy --result fail
else
    lava-test-case tinymembench-c-copy --result pass --measurement ${C_COPY}
fi

# C fill
if [ "$C_FILL" -lt "$C_FILL_MIN" ] || [ "$C_FILL" -gt "$C_FILL_MAX" ]; then
    lava-test-case tinymembench-c-fill --result fail
else
    lava-test-case tinymembench-c-fill --result pass --measurement ${C_FILL}
fi

# standard memcpy
if [ "$STD_MEMCPY" -lt "$STD_MEMCPY_MIN" ] || [ "$STD_MEMCPY" -gt "$STD_MEMCPY_MAX" ]; then
    lava-test-case tinymembench-std-memcpy --result fail
else
    lava-test-case tinymembench-std-memcpy --result pass --measurement ${STD_MEMCPY}
fi

# standard memset
if [ "$STD_MEMSET" -lt "$STD_MEMSET_MIN" ] || [ "$STD_MEMSET" -gt "$STD_MEMSET_MAX" ]; then
    lava-test-case tinymembench-std-memset --result fail
else
    lava-test-case tinymembench-std-memset --result pass --measurement ${STD_MEMSET}
fi

# latency for buffer block size 64MB
if [ "$LATENCY" -lt "$LATENCY_MIN" ] || [ "$LATENCY" -gt "$LATENCY_MAX" ]; then
    lava-test-case tinymembench-latency-64MB-buffer --result fail
else
    lava-test-case tinymembench-latency-64MB-buffer --result pass --measurement ${LATENCY}
fi
