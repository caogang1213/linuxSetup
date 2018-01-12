# !/bin/bash

# linux shell script to automatically install packages and softwares for linux system
# run after a completely new linux system is installed
# GangCao,  12/01/2018
# ===================================================================================


#------------------------------
# add necessary repositories
# upgrade linux kernel
# update repositories
sudo apt-get update
sudo apt-get upgrade

#-------------------------------
# grant linux user access without password
sudo visudo -f /etc/sudoers.d/nopass
echo "gangcao ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopass

#-------------------------------
# install personal small packages
sudo apt-get install fish
sudo apt-get install htop

# ------------------------------
# blacklist nouveau from starting at boot
# install NVIDIA Graphic card driver
# case 1: Ubuntu


# case 2: openSUSE
sudo apt-get install zypper
sudo zypper ref
sudo zypper install -t parttern devel_C_C++ devel_kernel

sudo zypper install wget

cd /home/gangcao/Desktop/
sudo wget "http://us.download.nvidia.com/XFree86/Linux-x86_64/384.111/NVIDIA-Linux-x86_64-384.111.run"
echo "blacklist nouveau" >> /etc/modprobe.d/50-blacklist.conf && mkinitrd

init 3

#------------------------------
# install Qt


#------------------------------
# install cuda


#------------------------------
# install opencv

#------------------------------
# install google chromium

#------------------------------
# install tex full

#------------------------------
# install texstudio

#------------------------------
# update vim
# install YouCompleteMe: cd /.../YouCompleteMe && ./install.py
cd /opt/
sudo apt-get install ncurses-dev
sudo wget https://github.com/vim/vim/archive/master.zip
sudo unzip master.zip
cd vim-master/src/
sudo ./configure --with-features=huge --enable-pythoninterp=yes --enable-cscope --with-python-config-dir=/usr/lib64/python2.7/config
sudo make -j8
sudo make install
sudo rm -rf vim-master
sudo rm master.zip

# sudo touch ~/.vimrc
# add content in  vimrc.txt to ~/.vimrc

#------------------------------
# install terminator

#------------------------------
# install tensorflow

#------------------------------
# install faster-rcnn
# update modified files

#------------------------------
# install daktnet and yolo
# update modified files







