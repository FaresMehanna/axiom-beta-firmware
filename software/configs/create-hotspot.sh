#!/bin/bash

hostapd /etc/hostapd/hostapd.conf


# redirect everything on that interface to a server which gives redirects
iptables -t nat -D PREROUTING -i wlan0 -p tcp --dport 80 -j DNAT --to 10.0.42.0:81
iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 80 -j DNAT --to 10.0.42.0:81
iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 443 -j DNAT --to 10.0.42.0:81
iptables -t nat -D PREROUTING -i wlan0 -p tcp --dport 443 -j DNAT --to 10.0.42.0:81