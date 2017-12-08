#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-VF61-256MB-IT
     0012)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-VF50-128MB
     0010)
        export ORIG_BYTEMARK_INT_MIN=0;
        export ORIG_BYTEMARK_INT_MAX=10000;
        export ORIG_BYTEMARK_FP_MIN=0;
        export ORIG_BYTEMARK_FP_MAX=10000;
        export LINUX_DATA_INT_MIN=0;
        export LINUX_DATA_INT_MAX=10000;
        export LINUX_DATA_FP_MIN=0;
        export LINUX_DATA_FP_MAX=10000;;

    #colibri-VF50-128MB-IT
     0013)
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
