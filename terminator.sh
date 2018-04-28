#!/bin/bash
#based on this guide: https://gnometerminator.blogspot.lt/2015/09/so-you-want-to-try-terminator-gtk3.html
set -e

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install gcc make build-essential gfortran texinfo
#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:deadsnakes/ppa
#sudo apt-get update
#sudo apt-get install python3.6
sudo ln -s /usr/bin/python2.7 /usr/bin/python
sudo apt-get install python-pip
pip install psutil
sudo apt-get install libgtk-3-dev
sudo apt-get install gir1.2-gconf-2.0
sudo apt-get install gir1.2-keybinder-3.0
sudo apt-get install intltool
sudo apt-get install gobject-introspection
sudo apt-get install libgirepository1.0-dev
sudo apt-get install valac
sudo apt-get install libxml2-utils

mkdir -p ~/Development/vte
cd ~/Development/vte
wget http://ftp.gnome.org/pub/GNOME/sources/vte/0.38/vte-0.38.0.tar.xz
tar xJvf vte-0.38.0.tar.xz
cd vte-0.38.0
./configure --prefix=/usr; make; sudo make install
cd ../
rm -rf ~/Development

sudo add-apt-repository ppa:gnome-terminator/nightly-gtk3
sudo apt-get update
sudo apt-get install terminator




