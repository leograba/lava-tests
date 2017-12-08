#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri T20 256MB
	0020) export FREE_MIN=125000; export RAM_MIN=250000;;
	# colibri T20 256MB IT
	0024) export FREE_MIN=125000; export RAM_MIN=250000;;
	# colibri T20 512MB
	0021) export FREE_MIN=250000; export RAM_MIN=500000;;
	# colibri T20 512MB IT
	0022) export FREE_MIN=250000; export RAM_MIN=500000;;

	*) false ;;
esac
