#!/bin/bash
# Created By M Fauzan Romandhoni 
# Sshinjector.net
# For Bussines E-Mail: m.fauzan58@yahoo.com
# TELP/WA : +6283875176829
clear

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Checking VPS"
echo -e "${green}Permission Accepted...${NC}"
sleep 1
clear
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop v2ray
systemctl stop v2ray@none
mkdir /root/.acme.sh
curl https://raw.githubusercontent.com/adminssh580808/..../main/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
echo Done
sleep 0.5

rm -f /root/fix.sh 
