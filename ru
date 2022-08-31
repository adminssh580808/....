#!/bin/bash

red="\033[0;32m"
green="\033[0;32m"
NC="\e[0m"
clear
echo ""
echo -e "\e[94m    .----------------------------------------------------.    "
echo -e "\e[94m    |              DISPLAYING RUNNING SYSTEM             |    "
echo -e "\e[94m    '----------------------------------------------------'    "
echo -e "\e[0m"
status="$(systemctl show xray@tls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    1. Xray Shadowsocks : Xray Shadowsocks Service is "$green"running"$NC""                  
else                                                                                    
echo -e "    1. Xray Shadowsocks : Xray Shadowsocks Service is "$red"not running (Error)"$NC""        
fi
status="$(systemctl show xray@tls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    2. Xray Trojan      : Xray Trojan Service is "$green"running"$NC""                  
else                                                                                    
echo -e "    2. Xray Trojan      : Xray Trojan Service is "$red"not running (Error)"$NC""        
fi
status="$(systemctl show xray@tls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    3. Xray Vless       : Xray Vless Service is "$green"running"$NC""                  
else                                                                                    
echo -e "    3. Xray Vless       : Xray Vless Service is "$red"not running (Error)"$NC""    
fi
status="$(systemctl show xray@tls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    4. Xray Vmess       : Xray Vmess Service is "$green"running"$NC""                  
else                                                                                    
echo -e "    4. Xray Vmess       : Xray Vmess Service is "$red"not running (Error)"$NC""        
fi
tatus="$(systemctl show xray@tls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    5. Xray Multi       : Xray Multi Service is "$green"running"$NC""                  
else                                                                                    
echo -e "    5. Xray Multi       : Xray Multi Service is "$red"not running (Error)"$NC""        
fi
status="$(systemctl show nginx.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    6. Nginx            : Nginx Service is "$green"running"$NC""                
else                                                                                    
echo -e "    6. Nginx            : Nginx Service is "$red"not running (Error)"$NC""      
fi
