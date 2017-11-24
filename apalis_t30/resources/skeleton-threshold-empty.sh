#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# apalis T30 1GB
	0026)
	# apalis T30 1GB IT
	0031)
	# apalis T30 2GB
	0025)

	*) false ;
esac
