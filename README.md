A collection of useful linux scripts, which would make your life easier.

### Content:
* memfree.sh - a small script to clear your cached and buffered RAM memory
* tstools.sh - a compilation script for building and installing the tstools for Debian based machines
* opencaster.sh - a compilation and installation script for Debian based distribution of [Opencaster](http://www.avalpa.com/the-key-values/15-free-software/33-opencaster "Opencaster Official Webpage")
* twopass_ffmpeg.sh - a script for 2-pass encoding of input mxf file which creates an output mp4 file
* toggle_touchpad.sh - a script to enable the touchpad in case it is disabled and disable if it is enabled. You can automate this with bindsym in `i3wm` by adding something like" 
* share_wifi.sh - This script shares the WiFi connection over the wired interface usually on your laptop. Please note that you need to change the lan_iface to point to the address of your wired interface and wlan_iface to the port name of your wireless interface. You also need to configure the gateway on the connected device to point to the IP address of the wired LAN interface. This could be done with `ip r add default via XXX.XXX.XXX.XXX` where the `XXX.XXX.XXX.XXX` is the IP address of your wired interface from where you are sharing the Internet. 
