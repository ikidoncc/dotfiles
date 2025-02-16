#!/bin/bash

echo "Configuring zsh..."

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

zsh-syntax-highlighting() {
	echo "INFO: Installing zsh-syntax-highlight!"
	mkdir -p "${HOME}/.zsh"
	rm -rf "${home}/.zsh/zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/zsh-syntax-highlighting"
	echo "INFO: zsh-syntax-highlighting installed!"
}

echo "INFO: Checking if yay is installed!"
install_yay

echo "INFO: Installing missing dependencies!"
yay -S bat exa fd ripgrep
zsh-syntax-highlighting

echo "INFO: Creating symbolic link!"
mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
ln -s "${PWD}/DOTzshrc" "${HOME}/.zshrc"
if [ -L "${HOME}/.zshrc" ] && [ -e "${HOME}/.zshrc" ]; then
	echo "INFO: Simbolic link created!"
fi
