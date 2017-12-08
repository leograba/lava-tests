#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri iMX6ULL 256MB
	0036) export FREE_MIN=125000; export RAM_MIN=250000;;
	# colibri iMX6ULL 512MB WiFi/BL IT
	0040) export FREE_MIN=250000; export RAM_MIN=500000;;

	*) false ;;
esac
