#!/bin/bash

echo "Memory Status before the RAM free-up"

free -h
sudo sync
sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches'
sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches'
sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'

echo "Freeing up the swap partition"
sudo swapoff -a
sudo swapon -a

echo "Memory Status after the RAM free-up"
free -h
