#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-T30-1GB
     0026)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=52;
        export MMC=61;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=16;
        export MMC=20;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=16;
        export MMC=20;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    #apalis-T30-1GB-IT
     0031)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=52;
        export MMC=61;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=16;
        export MMC=20;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=16;
        export MMC=20;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    #apalis-T30-2GB
     0025)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=52;
        export MMC=61;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=16;
        export MMC=20;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=16;
        export MMC=20;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    *) false ;;
 esac
