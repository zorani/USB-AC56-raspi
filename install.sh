#!/usr/bin/env bash

apt-get install vim
apt-get install bc
apt-get install dkms

evalpath=$(eval pwd)

declare -a arr_deps=("raspberrypi-kernel-headers" "vim" "bc" "dkms")

install_dependencies(){

	for dep in "${arr_deps[@]}"
	do
		command="dpkg-query -W -f='\${Status}\\n' $dep 2>/dev/null | grep -c \"ok installed\" "
		installCheck=$(eval $command)
		
		if [ $installCheck -eq 0 ]; then
			echo "$dep Status:NOT INSTALLED."
			echo "     Attempting to install $dep ..."
			echo
			apt-get --allow-change-held-packages --yes install $dep
		else
			echo "$dep Status:INSTALLED"
			echo
		fi
	done


}



install_USBAC56(){
git clone -b v5.2.20 https://github.com/aircrack-ng/rtl8812au.git
cd rtl*
./dkms-install.sh
}


install_dependencies
install_USBAC56

