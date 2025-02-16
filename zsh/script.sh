#!/bin/bash

echo "Configuring zsh..."

zsh-syntax-highlighting() {
	echo "INFO: Installing zsh-syntax-highlight!"
	mkdir -p "${HOME}/.zsh"
	rm -rf "${home}/.zsh/zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/zsh-syntax-highlighting"
	echo "INFO: zsh-syntax-highlighting installed!"
}

echo "INFO: Installing missing dependencies!"
yay -S bat exa fd ripgrep
zsh-syntax-highlighting

echo "INFO: Creating symbolic link!"
mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
ln -s "${PWD}/DOTzshrc" "${HOME}/.zshrc"
if [ -L "${HOME}/.zshrc" ] && [ -e "${HOME}/.zshrc" ]; then
	echo "INFO: Simbolic link created!"
fi
