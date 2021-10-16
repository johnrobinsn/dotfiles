#!/bin/bash

sudo apt install -y tmux emacs build-essential curl git

sudo apt install -y libgirepository1.0-dev gcc libcairo2-dev pkg-config python3-dev gir1.2-gtk-3.0 \
    gir1.2-gst-plugins-bad-1.0 openssh-server \
    gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav libnice-dev \
    gstreamer1.0-nice \
    v4l-utils hwinfo libdrm-dev


sudo apt install -y tmux emacs build-essential meson \
  libglib2.0-dev flex bison \
  libvorbis-dev libtheora-dev libflac-dev libdv4-dev \
  libwavpack-dev libopus-dev liba52-0.7.4-dev \
  libmp3lame-dev libmpeg2-4-dev libx264-dev libx265-dev \
  libsoup2.4-dev libsdl2-dev autoconf gtk-doc-tools libtool \
  cmake libcairo2-dev libsrtp2-dev libssl-dev \
  python3-gi python3-gst-1.0 ninja-build python3-pip


pip install --user meson



# needed for spark... should some of these be pulled into spark... I want to move awy from glut anyway to
# get better resizing behavior
sudo apt-get install -y libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev
sudo apt-get install -y libglew-dev
sudo apt-get install -y freeglut3-dev

sudo ln -s /usr/lib/x86_64-linux-gnu/libGLEW.so.2.1.0 /usr/lib/x86_64-linux-gnu/libGLEW.so.2.0


#gst-build
# meson build
# ninja -C buildnin

mkdir ~/setup_tmp
cd ~/setup_tmp


echo install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

#echo install node
#nvm install latest

echo install conda
curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh > ./Anaconda3-2021.05-Linux-x86_64.sh
bash ./Anaconda3-2021.05-Linux-x86_64.sh

conda config --set auto_activate_base false

echo "You can remove ~/setup_tmp"



# pip install PyGObject
# pip install python-socketio[client]
# pip install requests


# install nvidia drivers
#https://www.cyberciti.biz/faq/ubuntu-linux-install-nvidia-driver-latest-proprietary-driver/#verification