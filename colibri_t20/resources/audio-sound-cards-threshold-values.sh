#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-T20-256MB
     0020)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    #colibri-T20-256MB-IT
     0024)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    #colibri-T20-512MB
     0021)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    #colibri-T20-512MB-IT
     0022)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    *) false ;;
 esac
