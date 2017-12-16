#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX7S-256MB
     0032)
        export MMC=0;
        export MMC_MOUNT=;
        export MMC_MIN=;
        export MMC_MAX=;
        export SD1=1;
        export SD1_MOUNT=mmcblk0;
        export SD1_MIN=16;
        export SD1_MAX=23;
        export SD2=0;
        export SD2_MOUNT=;
        export SD2_MIN=;
        export SD2_MAX=;
        export USB=1;
        export USB_MOUNT=sda1;
        export USB_MIN=18;
        export USB_MAX=23;;

    #colibri-iMX7D-512MB
     0033)
        export MMC=0;
        export MMC_MOUNT=;
        export MMC_MIN=;
        export MMC_MAX=;
        export SD1=1;
        export SD1_MOUNT=mmcblk0;
        export SD1_MIN=16;
        export SD1_MAX=23;
        export SD2=0;
        export SD2_MOUNT=;
        export SD2_MIN=;
        export SD2_MAX=;
        export USB=1;
        export USB_MOUNT=sda1;
        export USB_MIN=16;
        export USB_MAX=23;;

    #colibri-iMX7D-1GB
     0039)
        export MMC=1;
        export MMC_MOUNT=mmcblk0;
        export MMC_MIN=;
        export MMC_MAX=;
        export SD1=1;
        export SD1_MOUNT=mmcblk1;
        export SD1_MIN=16;
        export SD1_MAX=23;
        export SD2=0;
        export SD2_MOUNT=;
        export SD2_MIN=;
        export SD2_MAX=;
        export USB=1;
        export USB_MOUNT=sda1;
        export USB_MIN=18;
        export USB_MAX=23;;

    *) false ;;
 esac
