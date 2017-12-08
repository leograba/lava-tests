#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Same values for all Apalis iMX6

	# apalis iMX6Q 2GB IT
	0028) export FREE_MIN=1000000; export RAM_MIN=2000000;;
	# apalis iMX6Q 1GB
	0027) export FREE_MIN=500000; export RAM_MIN=1000000;;
	# apalis iMX6D 1Gb IT
	0035) export FREE_MIN=500000; export RAM_MIN=1000000;;
	# apalis iMX6D 512MB
	0029) export FREE_MIN=250000; export RAM_MIN=500000;;

	*) false ;;
esac
