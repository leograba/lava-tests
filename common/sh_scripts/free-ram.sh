#!/bin/sh

set -x

TOTAL=$(free | grep Mem | awk '{ print $2 "\t"}')
FREE=$(free | grep Mem | awk '{ print $4 "\t"}')
MOD_ID=$(cat /proc/device-tree/toradex,product-id)

# The total amount of RAM should be tested also

case $MOD_ID in
	# Minimum free amount of ram to be defined, values set here are half the
	# total amount of RAM

	# apalis iMX6
	0028) FREE_MIN=1000000; RAM_MIN=2000000;; # apalis iMX6Q 2GB IT
	0027) FREE_MIN=500000; RAM_MIN=1000000;; # apalis iMX6Q 1GB
	0035) FREE_MIN=500000; RAM_MIN=1000000;; # apalis iMX6D 1GB IT
	0029) FREE_MIN=250000; RAM_MIN=500000;; # apalis iMX6D 512MB

	# apalis T30
	0026) FREE_MIN=500000; RAM_MIN=1000000;; # apalis T30 1GB
	0031) FREE_MIN=500000; RAM_MIN=1000000;; # apalis T30 1GB IT
	0025) FREE_MIN=1000000; RAM_MIN=2000000;; # apalis T30 2GB

	# apalis TK1
	0034) FREE_MIN=1000000; RAM_MIN=2000000;; # apalis TK1 2GB

	# colibri iMX6
	0014) FREE_MIN=125000; RAM_MIN=250000;; # colibri iMX6S 256MB
	0016) FREE_MIN=125000; RAM_MIN=250000;; # colibri iMX6S 256MB IT
	0015) FREE_MIN=250000; RAM_MIN=500000;; # colibri iMX6S 512MB
	0017) FREE_MIN=250000; RAM_MIN=500000;; # colibri iMX6S 512MB IT

	# colibri iMX6ULL
	0036) FREE_MIN=125000; RAM_MIN=250000;; # colibri iMX6ULL 256MB
	0040) FREE_MIN=250000; RAM_MIN=500000;; # colibri iMX6ULL 512MB WiFi/BL IT

	# colibri iMX7
	0032) FREE_MIN=125000; RAM_MIN=250000;; # colibri iMX7S 256MB
	0033) FREE_MIN=250000; RAM_MIN=500000;; # colibri iMX7D 512MB
	0039) FREE_MIN=500000; RAM_MIN=1000000;; # colibri iMX7D 1GB

	# colibri T30
	0023) FREE_MIN=500000; RAM_MIN=1000000;; # colibri T30 1GB
	0030) FREE_MIN=500000; RAM_MIN=1000000;; # colibri T30 1GB IT

	# colibri T20
	0020) FREE_MIN=125000; RAM_MIN=250000;; # colibri T20 256MB
	0024) FREE_MIN=125000; RAM_MIN=250000;; # colibri T20 256MB IT
	0021) FREE_MIN=250000; RAM_MIN=500000;; # colibri T20 512MB
	0022) FREE_MIN=250000; RAM_MIN=500000;; # colibri T20 512MB IT

	# colibri VF61
	0012) FREE_MIN=125000; RAM_MIN=250000;; # colibri VF61 256MB IT

	# colibri VF50
	0010) FREE_MIN=72500; RAM_MIN=125000;; # colibri VF50 128MB
	0013) FREE_MIN=72500; RAM_MIN=125000;; # colibri VF50 128MB IT

	*) exit 1 ;;
esac



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
