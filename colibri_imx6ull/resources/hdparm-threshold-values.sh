#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX6ULL-256MB
     0036)
        export MMC=0;
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-iMX6ULL-512MB-WiFi/BL-IT
     0040)
        export MMC=0;
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    *) false ;;
 esac
