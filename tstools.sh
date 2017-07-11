#!/bin/bash

echo "Installation of the required packages"

sudo apt update 
sudo apt install build-essential git -y

echo "Cloning of the tstools package from Github and compilation of the package"

git clone https://github.com/kynesim/tstools.git
cd tstools
make
sudo make install

route -n

echo
echo "This is a list of your currently configured intrefaces:"
echo
ip addr show 

echo
echo "Please select the interface through which you want to route your multicast traffic and press [ENTER]: "

read interf

sudo ip route add 224.0.0.0/3 dev $interf

echo
echo "This is how your routing table looks now:"
echo
route -n
