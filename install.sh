sudo -i
apt update && apt upgrade -y
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh 
chmod +x openvpn-install.sh
AUTO_INSTALL=y ./openvpn-install.sh
cp client.ovpn /home/ubuntu/
exit
exit
