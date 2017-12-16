#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX6S-256MB
     0014)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #colibri-iMX6S-256MB-IT
     0016)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #colibri-iMX6D-512MB
     0015)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #colibri-iMX6D-512MB-IT
     0017)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #colibri-iMX6ULL-256MB
     0036)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    #colibri-iMX6ULL-512MB-WiFi/BL-IT
     0040)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MIN=4000000;
        export FLASH_SIZE_MIN=1;;

    *) false ;;
 esac
