#!/bin/bash

install_asdf() {
	if ! command -v asdf &>/dev/null; then
		echo "INFO: Installing Asdf!"
		git clone https://aur.archlinux.org/asdf-vm.git /tmp/asdf-vm
		cd /tmp/asdf-vm
		makepkg -sic

		echo "${PWD}/config.txt" >> "${HOME}/.zshrc"
		source "${HOME}/.zshrc"

		mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
		asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
	else
		echo "INFO: Asdf already installed!"
	fi
}

echo "INFO: Checking if Asdf already installed!"
install_asdf
