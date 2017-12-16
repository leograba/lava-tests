#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-T30-1GB
     0023)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #colibri-T30-1GB-IT
     0030)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    *) false ;;
 esac
