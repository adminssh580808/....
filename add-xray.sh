#!/bin/bash

clear

domain=$(cat /etc/xray/domain)
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                read -rp "User: " -e user
                CLIENT_EXISTS=$(grep -w $user /etc/xray/vmess.json | wc -l)

                if [[ ${CLIENT_EXISTS} == '1' ]]; then
                        echo ""
                        echo "A client with the specified name was already created, please choose another name."
                        exit 1
                fi
        done
egrep -w "^### $user" /etc/xray/trojan.json >/dev/null
if [ $? -eq 0 ]; then
echo -e "Username Sudah Ada"
exit 0
fi

egrep -w "^### $user" /etc/xray/trojanws.json >/dev/null
if [ $? -eq 0 ]; then
echo -e "Username Sudah Ada"
exit 0
fi

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"2"',"email": "'""$user""'"' /etc/xray/vmess.json
cat>/etc/xray/$user-vmess.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
none=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/$user-vmess.json)"
vmesslink2="vmess://$(echo $none | base64 -w 0)"

sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vlgrpc.json
vlgrpclink1="vless://${uuid}@${domain}:443?mode=multi&security=tls&encryption=none&type=grpc&serviceName=vlgRPC&sni=bug.com#${user}"


sed -i '/#tls$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojan.json
trojanlink1="trojan://${uuid}@${domain}:443#$user"

sed -i '/#tls$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojanws.json
trojanlink2="trojan://${uuid}@${domain}:443/?sni=${domain}&type=ws&host=${domain}&path=/Trojan&encryption=none#${user}"
trojanlink3="trojan-go://${uuid}@${domain}:443/?sni=${domain}&type=ws&host=${domain}&path=/Trojan&encryption=none#${user}"

sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vless.json
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
systemctl restart xray@vmess
systemctl restart xray@vless
systemctl restart xray@vlgrpc
systemctl restart xray@trojan
systemctl restart xray@trojanws
service cron restart

clear
echo -e "
=============-XRAY-=============
Remarks        : ${user}
Domain         : ${domain}
Multi port     : 443, 80
id             : ${uuid}
alterId        : 0
Security       : auto
network        : ws
Key Trojan     : ${uuid}
path           : /vmess
path Vless     : /vless
path Vless gRPC: /vlgRPC
Path Trojan-Go : /Trojan
================================

==========-XRAY/VMESS-==========
link TLS       : ${vmesslink1}
================================
link none TLS  : ${vmesslink2}
================================

==========-XRAY/VLESS-==========
link TLS       : ${vlesslink1}
================================
link none TLS  : ${vlesslink2}

==========-VLESS/gRPC-==========
link TLS       : ${vlgrpclink1}
================================

============-Trojan-============
link           : ${trojanlink1}
================================

==========-Trojan-WS/GO==========
link Trojan-WS : ${trojanlink2}
link Trojan-GO : ${trojanlink3}
================================
Masa Aktif s/d : $exp"
