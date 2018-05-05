#!/bin/bash
#based on this guide: https://gnometerminator.blogspot.lt/2015/09/so-you-want-to-try-terminator-gtk3.html
set -e

#system dependencies
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install gcc make build-essential libtool automake pkg-config cmake
sudo apt-get -y install software-properties-common
sudo apt-get -y install python3-pip python3-dev

#terminator gtk3 dependencies
pip3 install psutil
sudo apt-get -y install libgtk-3-dev
sudo apt-get -y install gir1.2-gconf-2.0
sudo apt-get -y install gir1.2-keybinder-3.0
sudo apt-get -y install intltool
sudo apt-get -y install gobject-introspection
sudo apt-get -y install libgirepository1.0-dev
sudo apt-get -y install valac
sudo apt-get -y install libxml2-utils

mkdir -p ~/Development/vte
cd ~/Development/vte
wget http://ftp.gnome.org/pub/GNOME/sources/vte/0.38/vte-0.38.0.tar.xz
tar xJvf vte-0.38.0.tar.xz
cd vte-0.38.0
./configure --prefix=/usr; make; sudo make install
cd ../
rm -rf ~/Development

#terminator itself
sudo add-apt-repository -y ppa:gnome-terminator/nightly-gtk3
sudo apt-get -y update
sudo apt-get -y install terminator




