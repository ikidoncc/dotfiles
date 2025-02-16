#!/bin/bash

install_yay() {
	if ! command -v yay &>/dev/null; then
		echo "INFO: Installing Yay!"
		sudo pacman -S --needed git base-devel
		git clone https://aur.archlinux.org/yay.git /tmp/yay
		cd /tmp/yay || exit 1
		makepkg -sic --noconfirm
		cd - || exit 1
		rm -rf /tmp/yay
		echo "INFO: Yay installed!"
	else
		echo "INFO: Yay already installed!"
	fi
}

echo "INFO: Checking if yay is installed!"
install_yay
