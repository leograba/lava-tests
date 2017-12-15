#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-T20-256MB
     0020)
        export FLASH_SIZE_MIN=450000;
        export FLASH_SIZE_MAX=550000;
        export TYPE=2;;

    #colibri-T20-256MB-IT
     0024)
        export FLASH_SIZE_MIN=450000;
        export FLASH_SIZE_MAX=550000;
        export TYPE=2;;

    #colibri-T20-512MB
     0021)
        export FLASH_SIZE_MIN=900000;
        export FLASH_SIZE_MAX=1100000;
        export TYPE=2;;

    #colibri-T20-512MB-IT
     0022)
        export FLASH_SIZE_MIN=900000;
        export FLASH_SIZE_MAX=1100000;
        export TYPE=2;;

    *) false ;;
 esac
