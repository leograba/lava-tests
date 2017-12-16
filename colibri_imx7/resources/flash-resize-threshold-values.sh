#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX7S-256MB
     0032)
        export FLASH_SIZE_MIN=450000;
        export FLASH_SIZE_MAX=550000;
        export TYPE=2;;

    #colibri-iMX7D-512MB
     0033)
        export FLASH_SIZE_MIN=450000;
        export FLASH_SIZE_MAX=550000;
        export TYPE=2;;

    #colibri-iMX7D-1GB
     0039)
        export FLASH_SIZE_MIN=3000000;
        export FLASH_SIZE_MAX=4000000;
        export TYPE=1;;

    *) false ;;
 esac
