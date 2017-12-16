#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-iMX6Q-2GB-IT
     0028)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    #apalis-iMX6Q-1GB
     0027)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    #apalis-iMX6D-1GB-IT
     0035)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    #apalis-iMX6D-512MB
     0019)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=18;
        export MMC=23;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    *) false ;;
 esac
