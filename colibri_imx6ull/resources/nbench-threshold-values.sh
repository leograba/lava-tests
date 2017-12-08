#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX6ULL-256MB
     0036)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-iMX6ULL-512MB-WiFi/BL-IT
     0040)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    *) false ;;
 esac
