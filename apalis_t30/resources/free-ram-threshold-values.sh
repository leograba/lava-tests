#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# apalis T30 1GB
	0026) export FREE_MIN=500000; export RAM_MIN=1000000;;
	# apalis T30 1GB IT
	0031) export FREE_MIN=500000; export RAM_MIN=1000000;;
	# apalis T30 2GB
	0025) export FREE_MIN=1000000; export RAM_MIN=2000000;;

	*) false ;;
esac
