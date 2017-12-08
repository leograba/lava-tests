#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# apalis TK1 2GB
	0034) export FREE_MIN=1000000; export RAM_MIN=2000000;;

	*) false ;;
esac
