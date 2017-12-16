#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX7S-256MB
     0032)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-iMX7D-512MB
     0033)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-iMX7D-1GB
     0039)
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
