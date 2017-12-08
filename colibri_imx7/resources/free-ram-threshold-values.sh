#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri iMX7S 256MB
	0032) export FREE_MIN=125000; export RAM_MIN=250000;;
	# colibri iMX7D 512MB
	0033) export FREE_MIN=250000; export RAM_MIN=500000;;
	# colibri iMX7D 1GB
	0039) export FREE_MIN=500000; export RAM_MIN=1000000;;

	*) false ;;
esac
