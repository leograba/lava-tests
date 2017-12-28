#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #colibri-iMX6S-256MB
     0014)
        export ANALOG=imx6colibrisgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=imx6colibrisgtl;
        export LINE=imx6colibrisgtl;
        export USB_REC=HD3000;;

    #colibri-iMX6S-256MB-IT
     0016)
        export ANALOG=imx6colibrisgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=imx6colibrisgtl;
        export LINE=imx6colibrisgtl;
        export USB_REC=HD3000;;

    #colibri-iMX6D-512MB
     0015)
        export ANALOG=imx6colibrisgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=imx6colibrisgtl;
        export LINE=imx6colibrisgtl;
        export USB_REC=HD3000;;

    #colibri-iMX6D-512MB-IT
     0017)
        export ANALOG=imx6colibrisgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=imx6colibrisgtl;
        export LINE=imx6colibrisgtl;
        export USB_REC=HD3000;;

    #colibri-iMX6ULL-256MB
     0036)
        export ANALOG=imx6colibrisgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=imx6colibrisgtl;
        export LINE=imx6colibrisgtl;
        export USB_REC=HD3000;;

    #colibri-iMX6ULL-512MB-WiFi/BL-IT
     0040)
        export ANALOG=imx6colibrisgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=;
        export MIC=imx6colibrisgtl;
        export LINE=imx6colibrisgtl;
        export USB_REC=HD3000;;

    *) false ;;
 esac
