#!/bin/bash

KEY="~/.ssh/amazon.pem"
IP=$(terraform apply -auto-approve |awk '{print $3}'| sed 's/"//g')

#IP=52.47.147.117
echo "IP:" $IP
#echo "KEY:" $KEY
sleep 3m

echo "connecting to host" $IP
ssh ubuntu@$IP -i $KEY <<EOF
  curl ifconfig.me
  sudo -i
  apt update && apt upgrade -y
  curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh 
  chmod +x openvpn-install.sh
  AUTO_INSTALL=y ./openvpn-install.sh
  cp client.ovpn /home/ubuntu/
  exit
EOF
echo "getting vpn conf"
scp -i $KEY ubuntu@$IP:client.ovpn . 
