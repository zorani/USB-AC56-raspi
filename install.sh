#!/usr/bin/env bash

apt-get install vim
apt-get install bc
apt-get install dkms
git clone -b v5.2.20 https://github.com/aircrack-ng/rtl8812au.git
cd rtl*
./dkms-install.sh
