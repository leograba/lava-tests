#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-iMX6Q-2GB-IT
     0028)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #apalis-iMX6Q-1GB
     0027)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #apalis-iMX6D-1GB-IT
     0035)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #apalis-iMX6D-512MB
     0019)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    *) false ;;
 esac
