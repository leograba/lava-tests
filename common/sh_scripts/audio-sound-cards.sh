#!/bin/sh

set -x

if [ -z $1 ]; then echo "no module name"; exit 1; fi
source $(echo $1 | tr - _)/resources/audio-sound-cards.sh
if [ $? -ne 0 ]; then echo "wrong module ID or name"; exit 1; fi

# Playback: ANALOG, HDMI, USB_PLAY, SPDIF
# Record: MIC, LINE, USB_REC

DEFAULT="sysdefault:CARD="

# Analog audio playback
if [ ! -z "$ANALOG" ]; then
	if [ -n $(cat /proc/asound/cards | grep $ANALOG) ]; then
		lava-test-case analog-playback-device-exist --result pass
	else
		lava-test-case analog-playback-device-exist --result fail
	fi

	if [ -n $(aplay -l | grep $ANALOG) ]; then
		lava-test-case aplay-analog-playback-device-exist --result pass
	else
		lava-test-case aplay-analog-playback-device-exist --result fail
	fi
fi

# HDMI audio playback
if [ ! -z "$HDMI" ]; then
	if [ -n $(cat /proc/asound/cards | grep $HDMI) ]; then
		lava-test-case hdmi-playback-device-exist --result pass
	else
		lava-test-case hdmi-playback-device-exist --result fail
	fi

	if [ -n $(aplay -l | grep $HDMI) ]; then
		lava-test-case aplay-hdmi-playback-device-exist --result pass
	else
		lava-test-case aplay-hdmi-playback-device-exist --result fail
	fi
fi

# USB audio playback
if [ ! -z "$USB_PLAY" ]; then
	if [ -n $(cat /proc/asound/cards | grep $USB_PLAY) ]; then
		lava-test-case usb-playback-device-exist --result pass
	else
		lava-test-case usb-playback-device-exist --result fail
	fi

	if [ -n $(aplay -l | grep $USB_PLAY) ]; then
		lava-test-case aplay-usb-playback-device-exist --result pass
	else
		lava-test-case aplay-usb-playback-device-exist --result fail
	fi
fi

# SPDIF audio playback
if [ ! -z "$SPDIF" ]; then
	if [ -n $(cat /proc/asound/cards | grep $SPDIF) ]; then
		lava-test-case spdif-playback-device-exist --result pass
	else
		lava-test-case spdif-playback-device-exist --result fail
	fi

	if [ -n $(aplay -l | grep $SPDIF) ]; then
		lava-test-case aplay-spdif-playback-device-exist --result pass
	else
		lava-test-case aplay-spdif-playback-device-exist --result fail
	fi
fi

# Mic audio record
if [ ! -z "$MIC" ]; then
	if [ -n $(cat /proc/asound/cards | grep $MIC) ]; then
		lava-test-case mic-record-device-exist --result pass
	else
		lava-test-case mic-record-device-exist --result fail
	fi

	if [ -n $(arecord -l | grep $MIC) ]; then
		lava-test-case arecord-mic-record-device-exist --result pass
	else
		lava-test-case arecord-mic-record-device-exist --result fail
	fi
fi

# Line audio record
if [ ! -z "$LINE" ]; then
	if [ -n $(cat /proc/asound/cards | grep $LINE) ]; then
		lava-test-case line-record-device-exist --result pass
	else
		lava-test-case line-record-device-exist --result fail
	fi

	if [ -n $(arecord -l | grep $LINE) ]; then
		lava-test-case arecord-line-record-device-exist --result pass
	else
		lava-test-case arecord-line-record-device-exist --result fail
	fi
fi

# USB audio record
if [ ! -z "$USB_REC" ]; then
	if [ -n $(cat /proc/asound/cards | grep $USB_REC) ]; then
		lava-test-case usb-record-device-exist --result pass
	else
		lava-test-case usb-record-device-exist --result fail
	fi

	if [ -n $(arecord -l | grep $USB_REC) ]; then
		lava-test-case arecord-usb-record-device-exist --result pass
	else
		lava-test-case arecord-usb-record-device-exist --result fail
	fi
fi
