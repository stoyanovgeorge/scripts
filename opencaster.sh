#!/bin/bash

sudo update && sudo apt upgrade -y && sudo apt install wget -y

tar xvf opencaster_3.2.2+dfsg.orig.tar.gz
cd opencaster-3.2.2/

sudo apt install binutils gcc libc6-dev libgomp1 linux-libc-dev make python-dev zlib1g-dev python-dateutil -y

# Replaces net on line 15 with linux to fix a problem in the compilation of the program
sed -i '15s/net/linux/' tools/mpe2sec/mpe.c

make
sudo make install
