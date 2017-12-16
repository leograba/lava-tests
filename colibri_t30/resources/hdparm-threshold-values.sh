#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-T30-1GB
     0023)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=58;
        export MMC=62;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=16;
        export MMC=20;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-T30-1GB-IT
     0030)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=58;
        export MMC=62;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=16;
        export MMC=20;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    *) false ;;
 esac
