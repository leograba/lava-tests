#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri T30 1GB
	0023) export FREE_MIN=500000; export RAM_MIN=1000000;;
	# colibri T30 1GB IT
	0030) export FREE_MIN=500000; export RAM_MIN=1000000;;

	*) false ;;
esac
