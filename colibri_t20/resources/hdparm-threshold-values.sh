#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-T20-256MB
     0020)
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
    #colibri-T20-256MB-IT
     0024)
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
    #colibri-T20-512MB
     0021)
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
    #colibri-T20-512MB-IT
     0022)
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
