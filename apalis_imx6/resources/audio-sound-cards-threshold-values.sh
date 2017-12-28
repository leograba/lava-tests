#!/bin/sh
 set -x

 MOD_ID=$(cat /proc/device-tree/toradex,product-id)
 case $MOD_ID in



    #apalis-iMX6Q-2GB-IT
     0028)
        export ANALOG=imx6qapalissgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=imxspdif;
        export MIC=imx6qapalissgtl;
        export LINE=imx6qapalissgtl;
        export USB_REC=HD3000;;

    #apalis-iMX6Q-1GB
     0027)
        export ANALOG=imx6qapalissgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=imxspdif;
        export MIC=imx6qapalissgtl;
        export LINE=imx6qapalissgtl;
        export USB_REC=HD3000;;

    #apalis-iMX6D-1GB-IT
     0035)
        export ANALOG=imx6qapalissgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=imxspdif;
        export MIC=imx6qapalissgtl;
        export LINE=imx6qapalissgtl;
        export USB_REC=HD3000;;

    #apalis-iMX6D-512MB
     0019)
        export ANALOG=imx6qapalissgtl;
        export HDMI=imxhdmisoc;
        export USB_PLAY=Device;
        export SPDIF=imxspdif;
        export MIC=imx6qapalissgtl;
        export LINE=imx6qapalissgtl;
        export USB_REC=HD3000;;

    *) false ;;
 esac
