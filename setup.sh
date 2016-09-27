#!/bin/bash

#install essentials 
echo ===========================
echo == Installing essentials ==
echo ===========================
echo
sudo apt-get update -y
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y vim
sudo apt-get install -y tmux

#install zsh
echo
echo ==============================
echo == Installing zsh/oh-my-zsh ==
echo ==============================
echo
sudo groupadd chsh
sudo usermod -aG chsh $USER
sudo sed -i '/auth       required   pam_shells.so/ c\auth        sufficient    pam_wheel.so trust group=chsh' /etc/pam.d/chsh
sudo apt-get install -y zsh 
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh ./setup-oh-my-zsh.sh

#download fonts
echo
echo ================================================
echo == Downloading and installing PowerLine fonts ==
echo == Use: Source Code Pro f. PL. Regular 12     ==
echo ================================================
echo
git clone git@github.com:powerline/fonts.git ~/.fonts
~/.fonts/install.sh

#autoremove packages which are no longer required
echo
echo ======================================================
echo == Autoremove packages which are no longer required ==
echo ======================================================
echo
sudo apt-get autoremove -y

#copying dotfiles to homefolder
echo
echo ====================================
echo == Copying dotfiles to homefolder ==
echo ====================================
echo
cp .tmux.conf ~/.tmux.conf
cp .gitconfig ~/.gitconfig
cp .zshrc ~/.zshrc 
