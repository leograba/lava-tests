#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-iMX6Q-2GB-IT
     0028)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #apalis-iMX6Q-1GB
     0027)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #apalis-iMX6D-1GB-IT
     0035)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #apalis-iMX6D-512MB
     0019)
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
