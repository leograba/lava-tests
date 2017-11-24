#!/bin/sh

set -x

TOTAL=$(echo $2 | grep Mem | awk '{ print $2 "\t"}')
FREE=$(echo $2 | grep Mem | awk '{ print $4 "\t"}')
MOD_ID=$(cat /proc/device-tree/toradex,product-id)

# The total amount of RAM should be tested also

case $MOD_ID in
	# Minimum free amount of ram to be defined, values set here are half the
	# total amount of RAM

	apalis-imx6)
		NCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
		FREQ=$(cpufreq-info | grep "available frequency" | awk '{ print $7 "\t"}')
		if [ "$FREQ" -eq "$FREQ" ] 2>/dev/null ; then
			if [ "$NCPU" -eq 4 ] ; then
				FREE_MIN=500000; RAM_MIN=1000000 # iMX6 quad 1GB
			else FREE_MIN=250000; RAM_MIN=500000 # iMX6 dual 512MB
			fi
		else
			if [ "NCPU" -eq 4 ] ; then
				FREE_MIN=1000000; RAM_MIN=2000000 # iMX6 quad 2Gb IT
			else FREE_MIN=500000; RAM_MIN=1000000 # iMX6 dual 1Gb IT
			fi
		fi;;
	apalis-t30)
		FREE_MIN=500000; RAM_MIN=1000000;; # How to check if 2GB or 1GB?
	apalis-tk1)
		FREE_MIN=1000000; RAM_MIN=2000000;;
	colibri-imx6)
		NCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
		if [ "$NCPU" -eq 2 ] ; then
			FREE_MIN=250000; RAM_MIN=500000 # iMX6 dl
		else FREE_MIN=125000; RAM_MIN=250000 # iMX6 s
		fi;;
	colibri-imx6ull)
		FREE_MIN=; RAM_MIN=;; # Will have two version 512 MB and 256MB
	colibri-imx7) # Will soon have the 1GB version
		NCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
		if [ "$NCPU" -eq 2 ] ; then
			FREE_MIN=250000; RAM_MIN=500000 # iMX7 dual
		else FREE_MIN=125000; RAM_MIN=250000 # iMX7 single
		fi;;
	colibri-t30)
		FREE_MIN=500000; RAM_MIN=1000000;;
	colibri-t20)
		FREE_MIN=250000; RAM_MIN=500000;; # How to check if 512MB or 256MB?
	colibri-vf)
		FREE_MIN=; RAM_MIN=;;
	*) exit 1 ;;
esac



# Verify free amount of RAM memory

    RAM_FREE=$(free | grep Mem | awk '{ print $7 "\t"}')
    if [ "$RAM_FREE" -lt 350000 ]; then
        echo "Free RAM failed!" >> $GEN_LOG
    else
        echo "Free RAM ok!" >> $GEN_LOG
    fi
