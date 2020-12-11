echo "downloading openvpn installer"
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh 
echo "making it executable"
chmod +x openvpn-install.sh
echo "launching it headless"
AUTO_INSTALL=y ./openvpn-install.sh
echo "copying config in ubuntu home folder"
cp client.ovpn /home/ubuntu/
echo "all done, bye !"
exit
exit
