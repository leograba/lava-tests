#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri iMX7S 256MB
	0032)
	# colibri iMX7D 512MB
	0033)
	# colibri iMX7D 1GB
	0039)

	*) false ;
esac
