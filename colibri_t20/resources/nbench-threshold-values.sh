#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-T20-256MB
     0020)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-T20-256MB-IT
     0024)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-T20-512MB
     0021)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-T20-512MB-IT
     0022)
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
