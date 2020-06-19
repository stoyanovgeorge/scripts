#!/bin/bash


# Script to share the wireless Internet over the LAN interface of your laptop
# Make sure to configure the default GW on the other device to point to the $lan_iface IP

# Configuring the network adapter names according to `ip -a`
lan_iface="enp62s0u1"
wlan_iface="wlp2s0"

# Enable IP forwarding between the interfaces
sudo sysctl -w net.ipv4.ip_forward=1

# Forwarding the packets from WLAN <-> LAN
sudo iptables -A FORWARD -i "$lan_iface" -o "$wlan_iface" -j ACCEPT
sudo iptables -A FORWARD -i "$lan_iface" -o "$wlan_iface" -j ACCEPT

#Masquerading the outbound connections
sudo iptables -t nat -A POSTROUTING -o "$wlan_iface" -j MASQUERADE
