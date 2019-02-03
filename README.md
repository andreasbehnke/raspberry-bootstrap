# raspberry-bootstrap
Bootstrapping raspberry pi device using ansible

This

# sd card preparation

* download raspbian image from https://www.raspberrypi.org/downloads/raspbian/
* write image to sdcard
* make sure all partitions of created sdcard are mounted
* find out your mount prefix, for ubuntu this is "/media/[username]"
* copy wpa_supplicant.template.conf to wpa_supplicant.conf
* edit wpa_supplicant.conf and configure your SSID and your passphrase
* run ```prepare_sdcard.sh [mount prefix] [hostname]```
* place sdcard into raspberry pi and boot
* if you can connect to the device with ```ssh pi@ledtable.behnke.net``` using default password "raspberry", you are done with step 1


# provisioning with ansible, provoide password less login using ssh keys

* install ansible https://www.ansible.com/
* Edit ansible inventory and add new host to hosts list. Place this host into group "raspberry"
* Edit ansible inventory and configure all variables requred by role https://github.com/andreasbehnke/ansible-role-remote-access
* run playbook ```ansible-playbook raspberry.yml```
