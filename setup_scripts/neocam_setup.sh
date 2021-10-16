#!/bin/bash

# Other Setup
# sudo raspi-config
# enable ssh server
# increase gpu memory to 128
# enable camera
# reboot

git config --global user.name "John Robinson"
git config --global user.email "johnrobinsn@gmail.com" 
echo Don\'t forget to set password

echo install linux packages
sudo apt install -y tmux emacs build-essential meson \
  libglib2.0-dev flex bison \
  libvorbis-dev libtheora-dev libflac-dev libdv4-dev \
  libwavpack-dev libopus-dev liba52-0.7.4-dev \
  libmp3lame-dev libmpeg2-4-dev libx264-dev libx265-dev \
  libsoup2.4-dev libsdl2-dev autoconf gtk-doc-tools libtool \
  cmake libcairo2-dev libsrtp2-dev libssl-dev \
  python3-gi python3-gst-1.0 meson ninja-build \
  libgirepository1.0-dev
  
# Install gobject-introspection breaks gst-build below
  

echo remove old gstreamer
sudo rm -rf /usr/bin/gst-* /usr/{lib,libexec}/arm-linux-gnueabihf/gstreamer-1.0/ /usr/lib/arm-linux-gnueabihf/libgst*

cd ~
[ ! -d code ] && mkdir code
cd code

echo build libnice
[ ! -d libnice ] && git clone https://gitlab.freedesktop.org/libnice/libnice.git 
cd libnice
git checkout 0.1.14
./autogen.sh --disable-gtk-doc
sudo make install
cd ..

echo build libvpx
[ ! -d libvpx ] && git clone https://chromium.googlesource.com/webm/libvpx
cd libvpx
./configure --enable-shared --disable-examples --disable-unit-tests
sudo make install
cd ..

echo build gstreamer
[ ! -d gst-build ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-build
cd gst-build
meson build  -Dintrospection=enabled
ninja -C build
sudo ninja -C build install
cd ..

#do I still need this?... I don't think so
#export GI_TYPELIB_PATH=/usr/lib/arm-linux-gnueabihf/girepository-1.0
#still need this one
export GI_TYPELIB_PATH=/usr/local/lib/arm-linux-gnueabihf/girepository-1.0


pip3 install PyGObject
pip3 install python-socketio[client]


echo getting neortc
[ ! -d neortc ] && git clone https://github.com/johnrobinsn/neortc.git

