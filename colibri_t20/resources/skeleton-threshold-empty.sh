#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri T20 256MB
	0020)
	# colibri T20 256MB IT
	0024)
	# colibri T20 512MB
	0021)
	# colibri T20 512MB IT
	0022)

	*) false ;
esac
