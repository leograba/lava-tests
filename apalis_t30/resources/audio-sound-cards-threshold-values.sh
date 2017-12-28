#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-T30-1GB
     0026)
        export ANALOG=apalist30sgtl50;
        export HDMI=Tegra;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=apalist30sgtl50;
        export LINE=apalist30sgtl50;
        export USB_REC=HD3000;;

    #apalis-T30-1GB-IT
     0031)
        export ANALOG=apalist30sgtl50;
        export HDMI=Tegra;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=apalist30sgtl50;
        export LINE=apalist30sgtl50;
        export USB_REC=HD3000;;

    #apalis-T30-2GB
     0025)
        export ANALOG=apalist30sgtl50;
        export HDMI=Tegra;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=apalist30sgtl50;
        export LINE=apalist30sgtl50;
        export USB_REC=HD3000;;

    *) false ;;
 esac
