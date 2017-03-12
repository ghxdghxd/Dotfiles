#!/bin/bash
set -e

if [ ! -n "$DOT" ]; then
    DOT=$HOME/dotfile
fi

LSB_DISTRIBUTOR=`lsb_release -i -s`

if [[ "$LSB_DISTRIBUTOR" == "Ubuntu" ]]; then
    alias Install="apt-get install -y"
fi

sudo apt-get update
sudo apt-get upgrade

## fcitx
echo -e "Installing fcitx-table-wbpy ..."
Install fcitx-table-wbpy

Install exfat-fuse
Install gfortran
Install sshfs

## guake
echo -e "Installing guake ..."
Install guake

## unity-tweak-tool
echo -e "Installing unity-tweak-tool ..."
Install unity-tweak-tool

## docky
echo -e "Installing docky ..."
Install docky

## git
#echo -e "Installing git ..."
#Install git

## python
#echo -e "Installing pyenv ..."
#curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash


## vim
echo -e "Installing vim ..."

Install vim vim-gnome ctags xclip astyle python-setuptools python-dev git

sh -c "$(curl -fsSL https://raw.github.com/ma6174/vim/master/setup.sh)"


## zsh && oh-my-zsh
echo -e "Installing zsh ..."
Install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



## wiznote

sudo apt-get install libqt4-dev libqtwebkit4
wget http://ppa.launchpad.net/wiznote-team/ppa/ubuntu/pool/main/w/wiznote/wiznote_2.3.2.4_amd64.deb
sudo dpkg -i wiznote_2.3.2.4_amd64.deb

if [[ "$LSB_DISTRIBUTOR" == "Ubuntu" ]]; then
    echo -e "Installing wiznote ..."
    sudo add-apt-repository ppa:wiznote-team
    sudo apt-get update
    sudo apt-get install wiznote
fi
if [[ "$LSB_DISTRIBUTOR" == "Fedora" ]]; then
    sudo yum install dnf-plugins-core
    sudo dnf copr enable mosquito/myrepo
    sudo yum localinstall http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo yum install wiznote      # Stable version


## chrome
sudo apt-get -f install libpango-1.0-0 libpango1.0-0-dbg libappindicator1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

## R && Rstudio

apt-get install libreadline6-dev
apt-get install libxt-dev
apt-get install texinfo
apt-get insatll texlive


## java


