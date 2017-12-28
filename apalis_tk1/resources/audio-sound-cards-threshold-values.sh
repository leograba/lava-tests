#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-TK1-2GB
     0034)
        export ANALOG=;
        export HDMI=;
        export USB_PLAY=;
        export SPDIF=;
        export MIC=;
        export LINE=;
        export USB_REC=;;

    *) false ;;
 esac
