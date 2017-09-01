#!/bin/bash

echo "Update and installation of the required packages"

sudo update
sudo apt upgrade -y 

sudo apt install wget \
binutils \
gcc \
libc6-dev \
libgomp1 \
linux-libc-dev \
make \
python-dev \
zlib1g-dev \
python-dateutil -y

echo "Download and extraction of the Opencaster Software"
wget http://ftp.de.debian.org/debian/pool/main/o/opencaster/opencaster_3.2.2+dfsg.orig.tar.gz
tar xvf opencaster_3.2.2+dfsg.orig.tar.gz
cd opencaster-3.2.2/

echo "Replaces net on line 15 with linux to fix a problem in the compilation of the program"
sed -i '15s/net/linux/' tools/mpe2sec/mpe.c

echo "Compilation of the Opencaster package"

make
sudo make install
