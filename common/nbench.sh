#!/bin/sh

set -x

LOG=$1
ORIG_BYTEMARK_INT=cat nbench.log | grep "INTEGER" | cut -d':' -f2 | cut -d$'\n' -f1
ORIG_BYTEMARK_FP=cat nbench.log | grep "FLOAT" | cut -d':' -f2 | cut -d$'\n' -f1
LINUX_DATA_INT=cat nbench.log | grep "INTEGER" | cut -d':' -f2 | cut -d$'\n' -f2
LINUX_DATA_FP=cat nbench.log | grep "FLOAT" | cut -d':' -f2 | cut -d$'\n' -f2

lava-test-case orig-bytemark-integer --result pass --measurement ${ORIG_BYTEMARK_INT}
lava-test-case orig-bytemark-fp --result pass --measurement ${ORIG_BYTEMARK_FP}
lava-test-case linux-data-integer --result pass --measurement ${LINUX_DATA_INT}
lava-test-case linux-data-fp --result pass --measurement ${LINUX_DATA_FP}
