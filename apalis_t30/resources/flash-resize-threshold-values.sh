#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-T30-1GB
     0026)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MAX=4000000;
        export TYPE=1;;

    #apalis-T30-1GB-IT
     0031)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MAX=4000000;
        export TYPE=1;;

    #apalis-T30-2GB
     0025)
        export FLASH_SIZE_MIN=7000000;
        export FLASH_SIZE_MAX=8000000;
        export TYPE=1;;

    *) false ;;
 esac
