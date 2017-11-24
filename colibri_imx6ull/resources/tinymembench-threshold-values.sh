#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri iMX6ULL
	0036)	export C_COPY_MIN=500; export C_COPY_MAX=2000; # colibri iMX6ULL 256MB
			export C_FILL_MIN=1000; export C_FILL_MAX=3000;
			export STD_MEMCPY_MIN=500; export STD_MEMCPY_MAX=2000;
			export STD_MEMSET_MIN=1000; export STD_MEMSET_MAX=3000;
			export LATENCY_MIN=60; export LATENCY_MAX=250;;
	0040)	export C_COPY_MIN=500; export C_COPY_MAX=2000; # colibri iMX6ULL 512MB WiFi/BL IT
			export C_FILL_MIN=1000; export C_FILL_MAX=3000;
			export STD_MEMCPY_MIN=500; export STD_MEMCPY_MAX=2000;
			export STD_MEMSET_MIN=1000; export STD_MEMSET_MAX=3000;
			export LATENCY_MIN=60; export LATENCY_MAX=250;;

	*) false ;
esac
