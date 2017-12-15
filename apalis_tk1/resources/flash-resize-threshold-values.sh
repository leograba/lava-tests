#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-TK1-2GB
     0034)
        export FLASH_SIZE_MIN=15000000;
        export FLASH_SIZE_MIN=16000000;
        export FLASH_SIZE_MIN=1;;

    *) false ;;
 esac
