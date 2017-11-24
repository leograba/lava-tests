#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# apalis T30
	0026)	export C_COPY_MIN=500; export C_COPY_MAX=2000; # apalis T30 1GB
			export C_FILL_MIN=1000; export C_FILL_MAX=3000;
			export STD_MEMCPY_MIN=500; export STD_MEMCPY_MAX=2000;
			export STD_MEMSET_MIN=1000; export STD_MEMSET_MAX=3000;
			export LATENCY_MIN=60; export LATENCY_MAX=250;;
	0031)	export C_COPY_MIN=500; export C_COPY_MAX=2000; # apalis T30 1GB IT
			export C_FILL_MIN=1000; export C_FILL_MAX=3000;
			export STD_MEMCPY_MIN=500; export STD_MEMCPY_MAX=2000;
			export STD_MEMSET_MIN=1000; export STD_MEMSET_MAX=3000;
			export LATENCY_MIN=60; export LATENCY_MAX=250;;
	0025)	export C_COPY_MIN=500; export C_COPY_MAX=2000; # apalis T30 2GB
			export C_FILL_MIN=1000; export C_FILL_MAX=3000;
			export STD_MEMCPY_MIN=500; export STD_MEMCPY_MAX=2000;
			export STD_MEMSET_MIN=1000; export STD_MEMSET_MAX=3000;
			export LATENCY_MIN=60; export LATENCY_MAX=250;;

	*) exit 1 ;
esac
