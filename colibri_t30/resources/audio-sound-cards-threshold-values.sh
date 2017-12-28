#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-T30-1GB
     0023)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    #colibri-T30-1GB-IT
     0030)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    *) false ;;
 esac
