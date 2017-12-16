#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-TK1-2GB
     0034)
        export MMC=1;
        export MMC=mmcblk0;
        export MMC=76;
        export MMC=80;
        export MMC=1;
        export MMC=mmcblk1;
        export MMC=19;
        export MMC=23;
        export MMC=1;
        export MMC=mmcblk2;
        export MMC=19;
        export MMC=23;
        export MMC=1;
        export MMC=sda1;
        export MMC=18;
        export MMC=23;;

    *) false ;;
 esac
