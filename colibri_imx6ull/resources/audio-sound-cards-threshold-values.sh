#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX6ULL-256MB
     0036)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    #colibri-iMX6ULL-512MB-WiFi/BL-IT
     0040)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    *) false ;;
 esac
