#!/bin/sh

set -x

if [ -z $1 ]; then echo "no module name"; exit 1; fi
source $1/resources/free-ram-threshold-values.sh
if [ $? -ne 0 ]; then echo "wrong module ID or name"; exit 1; fi

TOTAL=$(free | grep Mem | awk '{ print $2 "\t"}')
FREE=$(free | grep Mem | awk '{ print $4 "\t"}')

# Verify free amount of RAM memory
if [ "$FREE" -gt "$FREE_MIN" ]; then
    lava-test-case free-ram-result --result pass --measurement ${FREE}
else
    lava-test-case free-ram-result --result fail
fi

# Verify total amount of RAM memory
if [ "$TOTAL" -gt "$RAM_MIN" ]; then
    lava-test-case total-ram-result --result pass --measurement ${TOTAL}
else
    lava-test-case total-ram-result --result fail
fi
