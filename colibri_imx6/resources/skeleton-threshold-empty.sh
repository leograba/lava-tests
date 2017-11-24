#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri iMX6S 256MB
	0014)
	# colibri iMX6S 256MB IT
	0016)
	# colibri iMX6DL 512MB
	0015)
	# colibri iMX6DL 512MB IT
	0017)

	*) false ;
esac
