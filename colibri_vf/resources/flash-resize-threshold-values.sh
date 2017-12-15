#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-VF61-256MB-IT
     0012)
        export FLASH_SIZE_MIN=450000;
        export FLASH_SIZE_MAX=550000;
        export TYPE=2;;

    #colibri-VF50-128MB
     0010)
        export FLASH_SIZE_MIN=100000;
        export FLASH_SIZE_MAX=130000;
        export TYPE=2;;

    #colibri-VF50-128MB-IT
     0013)
        export FLASH_SIZE_MIN=100000;
        export FLASH_SIZE_MAX=130000;
        export TYPE=2;;

    *) false ;;
 esac
