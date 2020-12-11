#!/bin/bash

KEY="~/.ssh/amazon.pem"
echo "Launching instance"
IP=$(terraform apply -auto-approve |awk '{print $3}'| sed 's/"//g')
echo "Instance launched... starting"
echo "IP:" $IP
#echo "KEY:" $KEY
echo "Instance launched... starting... please wait"
sleep 3m
echo "connecting to host" $IP
echo "ssh ubuntu@$IP -i $KEY"
ssh ubuntu@$IP -i $KEY 'sudo wget https://raw.githubusercontent.com/arthurzinck/ondemand-vpn/master/install.sh -O install.sh && sudo bash install.sh'

echo "getting vpn conf"
scp -i $KEY ubuntu@$IP:client.ovpn .

openvpn client.ovpn
