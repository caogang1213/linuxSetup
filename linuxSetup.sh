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
sudo zypper install -t pattern devel_C_C++ devel_kernel devel_basis
sudo zypper install gcc-c++ qt-devel


sudo zypper install wget git cmake pkg-config

#------------------------------
# sudo
sudo visudo -f /etc/sudoers.d/nopass
# "gangcao ALL=(ALL) NOPASSWD:ALL"
reboot

#------------------------------
# install nvidia graphic card driver
sudo ln -s /usr/src/linux-$(uname -r)/include/generated/uapi/linux/version.h /usr/src/linux-$(uname -r)/include/linux/
cd /home/gangcao/Desktop/
sudo wget "http://us.download.nvidia.com/XFree86/Linux-x86_64/384.111/NVIDIA-Linux-x86_64-384.111.run"
echo "blacklist nouveau" >> /etc/modprobe.d/50-blacklist.conf && mkinitrd

# Ctrl + Alt + F1
# login with user account, and su-
init 3
cd /home/gangcao/Desktop/
chmod 777 NVIDIA-Linux-x86_64-384.111.run
./NVIDIA-Linux-x86_64-384.111.run

#------------------------------
# install cuda
cd /home/gangcao/Download/
chmod 777 cuda_8.0.61_375.26_linux.run
./cuda_8.0.61_375.26_linux.run
sudo touch /etc/ld.so.conf.d/cuda.conf
echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf
# For cuda
echo "export PATH="/usr/local/cuda/bin:$PATH"" >> ~/.bashrc
echo "export CUDA_PATH="/usr/local/cuda"" >> ~/.bashrc

#------------------------------
# install cudnn
# install cuDNN v6.0
cd /home/gangcao/Desktop
wget http://developer.download.nvidia.com/compute/redist/cudnn/v6.0/cudnn-8.0-linux-x64-v6.0.tgz
tar -xzvf cudnn-8.0-linux-x64-v6.0.tgz"
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-8.0/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-8.0/lib64/
sudo chmod a+r /usr/local/cuda-8.0/lib64/libcudnn*

#------------------------------
# install Qt
sudo chmod +x qt-opensource-linux-x64-5.9.1.run && ./qt-opensource-linux-x64-5.9.1.run
sudo touch /etc/ld.so.conf.d/qt.conf
echo "/opt/Qt/lib" >> /etc/ld.so.conf.d/qt.conf
sudo ln -s /opt/Qt5.9.1/5.9/gcc_64/ /opt/Qt
sudo vim ~/.bashrc
# For Qt 
echo "export PATH="/opt/Qt/bin:$PATH"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH="/opt/Qt/lib:$LD_LIBRARY_PATH"" >> ~/.bashrc

#------------------------------
# install scim-pinyin
sudo zypper addrepo https://download.opensuse.org/repositories/M17N/openSUSE_Leap_42.2/M17N.repo
sudo zypper refresh
sudo zypper install scim-pinyin

#------------------------------
# install tensorflow 
sudo apt-get install python-pip python-dev
sudo python2.7 -m pip install --upgrade \
  https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.3.0-cp27-none-linux_x86_64.whl

#------------------------------
# install python packages
sudo apt-get install python-tk python-pyside
sudo python2.7 -m pip install matplotlib lxml Pillow scipy

#------------------------------
# install opencv
cd /home/gangcao/
sudo git clone https://github.com/Itseez/opencv.git
sudo git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib/
sudo git checkout 3.2.0
cd ..
cd opencv
sudo git checkout 3.2.0
sudo mkdir build
cd build/
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D WITH_QT=ON -D WITH_CUDA=ON \
      -D WITH_OPENGL=ON \
      -D BUILD_PERF_TESTS=OFF \
      -D BUILD_TESTS=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=/home/gangcao/opencv_contrib/modules/ \
      -D CMAKE_INSTALL_PREFIX=/opt/opencv-3 ../
sudo make -j8
sudo make install
sudo ln -s /opt/opencv-3 /opt/opencv
sudo touch  /etc/ld.so.conf.d/opencv.conf
echo "/opt/opencv/lib" >> /etc/ld.so.conf.d/opencv.conf
# For pkg-config
echo "export PKG_CONFIG_PATH="/opt/opencv/lib/pkgconfig:$PKG_CONFIG_PATH"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH="/opt/opencv/lib:$LD_LIBRARY_PATH"" >> ~/.bashrc

#------------------------------
# install google chromium
sudo apt-get install chromium-browser

#------------------------------
# install texlive full

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
# install faster-rcnn
# update modified files

#------------------------------
# install daktnet and yolo
# update modified files







