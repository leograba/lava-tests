#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX6S-256MB
     0014)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=19;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-iMX6S-256MB-IT
     0016)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=19;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-iMX6D-512MB
     0015)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=19;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-iMX6D-512MB-IT
     0017)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=19;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-iMX6ULL-256MB
     0036)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=19;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    #colibri-iMX6ULL-512MB-WiFi/BL-IT
     0040)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=78;
        export MMC=82;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=19;
        export MMC=23;
        export MMC=0;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;
    *) false ;;
 esac
