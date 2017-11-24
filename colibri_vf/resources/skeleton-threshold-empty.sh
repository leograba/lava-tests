#!/bin/sh

set -x

MOD_ID=$(cat /proc/device-tree/toradex,product-id)
case $MOD_ID in
	# Which parameters to check? Thresholds must be revised

	# colibri VF61 256MB IT
	0012)
	# colibri VF50 128MB
	0010)
	# colibri VF50 128MB IT
	0013)

	*) false ;
esac
