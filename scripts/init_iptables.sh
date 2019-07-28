#!/bin/sh

#emptying the tables
iptables -t filter -F
iptables -t nat    -F
iptables -t mangle -F
iptables -t raw    -F
iptables -t filter -X VPN_FW

#setting the policies
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT ACCEPT

#Dropping common attack patterns : null packets, syn-flood and recon
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

#allowing answers to outgoing connections
iptables -I INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#allowing OPENVPN
iptables -t filter -A INPUT -p udp --dport 1194 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 1194 -j ACCEPT

#allowing OPENVPN on port 22
iptables -t filter -A INPUT -p udp --dport 22 -j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 22 -j REDIRECT --to-port 1194
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 1194

#allowing OPENVPN on port 443
iptables -t filter -A INPUT -p udp --dport 443 -j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 443 -j REDIRECT --to-port 1194
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 1194

#allowing OPENVPN on port 8080
iptables -t filter -A INPUT -p udp --dport 8080 -j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 8080 -j REDIRECT --to-port 1194
iptables -t filter -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to-port 1194

#Allowing apache HTTPS
#REDIRECTED THROUGH OPENVPN TCP/443
#iptables -t filter -A INPUT -p tcp --dport 1443 -j ACCEPT 


#Allowing openSSH
iptables -t filter -A INPUT -p tcp --dport 222 -j ACCEPT

#Allowing HTTP
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT

#Allowing routing daemon from VPN
iptables -t filter -A INPUT -p tcp --dport 1500 -d 172.16.100.1 -s 172.16.100.0/25 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 1500 -d 172.16.100.129 -s 172.16.100.0/25 -j ACCEPT

#Allowing all localhost traffic
iptables -t filter -A INPUT -i lo -j ACCEPT

#Creating a chain for VPN traffic and dropping everything by default
iptables -t filter -N VPN_FW
iptables -t filter -A VPN_FW -j DROP

#redirecting everything from the VPN to the new chain
iptables -t filter -I FORWARD -i tun+ -j VPN_FW

#Masquerading VXLAN traffic leaving the server
iptables -t nat -I POSTROUTING -o tun+ -p udp --dport 4789 -j MASQUERADE
