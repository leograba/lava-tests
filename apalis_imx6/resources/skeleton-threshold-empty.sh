#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Same values for all Apalis iMX6

	# apalis iMX6Q 2GB IT
	0028) 
	# apalis iMX6Q 1GB
	0027)
	# apalis iMX6D 1Gb IT
	0035)
	# apalis iMX6D 512MB
	0029)

	*) false ;
esac
