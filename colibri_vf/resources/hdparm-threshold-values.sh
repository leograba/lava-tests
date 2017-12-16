#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-VF61-256MB-IT
     0012)
        export MMC=0;
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=16;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-VF50-128MB
     0010)
        export MMC=0;
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=16;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-VF50-128MB-IT
     0013)
        export MMC=0;
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=16;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    *) false ;;
 esac
