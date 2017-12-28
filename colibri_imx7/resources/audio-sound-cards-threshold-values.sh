#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX7S-256MB
     0032)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    #colibri-iMX7D-512MB
     0033)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    #colibri-iMX7D-1GB
     0039)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    *) false ;;
 esac
