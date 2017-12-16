#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX6ULL-256MB
     0036)
        export FLASH_SIZE_MIN=100000;
        export FLASH_SIZE_MAX=130000;
        export TYPE=2;;

    #colibri-iMX6ULL-512MB-WiFi/BL-IT
     0040)
        export FLASH_SIZE_MIN=450000;
        export FLASH_SIZE_MAX=550000;
        export TYPE=2;;

    *) false ;;
 esac
