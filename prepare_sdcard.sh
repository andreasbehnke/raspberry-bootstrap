#!/bin/bash

function usage {
  echo "usage:"
  echo "prepare_sdcard.sh [path to mount prefix] [hostname]"
}
if [ ! -f wpa_supplicant.conf ]; then
    echo "Missing wifi configuration file!"
    echo "Please edit file wpa_supplicant.conf an set SSID and passphrase before running configuration again."
    cp wpa_supplicant.template.conf wpa_supplicant.conf
    exit
fi
if [ -z "$1" ]
  then
    echo "Provide path to mount prefix and hostname as paramater!"
    usage
    exit
fi
if [ -z "$2" ]
  then
    echo "Provide path to mount prefix and hostname as paramater!"
    usage
    exit
fi
# wifi configuration
cp wpa_supplicant.conf $1/boot
# enable ssh
echo "" > $1/boot/ssh
# set hostname, need root access for that
echo "$2" > $1/rootfs/etc/hostname
