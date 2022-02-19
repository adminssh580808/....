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
MYIP=$(wget -qO- https://icanhazip.com);
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tls=2443
http=3443
echo ""
echo "Masukkan password"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/shadowsocks-libev/akun.conf | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A Client Username Was Already Created, Please Enter New Username"
			exit 1
		fi
	done
read -p "Expired (hari): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat > /etc/shadowsocks-libev/$user-tls.json<<END
{   
    "server":"0.0.0.0",
    "server_port":$tls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=tls"
}
END
cat > /etc/shadowsocks-libev/$user-http.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$http,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=http"
}
END
chmod +x /etc/shadowsocks-libev/$user-tls.json
chmod +x /etc/shadowsocks-libev/$user-http.json

systemctl start shadowsocks-libev-server@$user-tls.service
systemctl enable shadowsocks-libev-server@$user-tls.service
systemctl start shadowsocks-libev-server@$user-http.service
systemctl enable shadowsocks-libev-server@$user-http.service
tmp1=$(echo -n "aes-256-cfb:${user}@${domain}:$tls" | base64 -w0)
tmp2=$(echo -n "aes-256-cfb:${user}@${domain}:$http" | base64 -w0)
linkss1="ss://${tmp1}?plugin=obfs-local;obfs=tls;obfs-host=line.me"
linkss2="ss://${tmp2}?plugin=obfs-local;obfs=http;obfs-host=line.me"
echo -e "### $user $exp
port_tls $tls
port_http $http">>"/etc/shadowsocks-libev/akun.conf"
service cron restart
clear

echo -e ""
echo -e "==============================="
echo -e "Shadowsocks Information Account"
echo -e "==============================="
echo -e "Host           : $domain"
echo -e "IP             : $MYIP"
echo -e "Port OBFS TLS  : $tls"
echo -e "Port OBFS HTTP : $http"
echo -e "Password       : $user"
echo -e "Method         : aes-256-cfb"
echo -e "Expired On     : $exp"
echo -e "==============================="
echo -e "Link OBFS TLS  : $linkss1"
echo -e "==============================="
echo -e "Link OBFS HTTP : $linkss2"
echo -e "==============================="
echo -e ""
