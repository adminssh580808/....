#!/bin/bash
# REMODE

clear
RED="\e[031;1m"
GREEN="\e[032;1m"
YELLOW="\e[033;1m"
BLUE="\e[034;1m"
PURPLE="\e[035;1m"
CYAN="\e[036;1m"
LIGHT="\e[037;1m"
NC="\e[0m"

echo -e "  ${YELLOW}======================================================== ${NC}"
echo -e ""
echo -e "  ${YELLOW}------=[${NC} ${RED}AUTO SCRIPT PREMIUM BY SSHINJECTOR.NET${NC} ${YELLOW}]=------ ${NC}"
DOMAIN=$(cat /etc/xray/domain.conf)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IP=$(curl -s ipinfo.io/ip )
JAM=$(date +"%T")
HARI=$(date +"%A")
TGL=$(date +"%d-%B-%Y")
echo -e "    ${GREEN} DOMAIN :${NC}${LIGHT} ${DOMAIN} ${NC}"
echo -e "    ${GREEN} IP VPS :${NC}${LIGHT} ${IP} ${NC}"
echo -e "    ${GREEN} ISP    :${NC}${LIGHT} ${ISP} ${NC}"
echo -e "    ${GREEN} DAY    :${NC}${LIGHT} ${HARI} ${NC}"
echo -e "    ${GREEN} DATE   :${NC}${LIGHT} ${TGL} ${NC}"
echo -e "    ${GREEN} TIME   :${NC}${LIGHT} ${JAM} ${NC}"
echo -e "    ${GREEN} CITY   :${NC}${LIGHT} ${CITY} ${NC}"
echo -e "    ${GREEN} ZONE   :${NC}${LIGHT} ${WKT} ${NC}"
echo -e ""
echo -e " ${YELLOW} -------------------=[${NC} ${RED}XRAY SERVICE${NC} ${YELLOW}]=------------------- ${NC}"
echo -e "    ${GREEN} 1${NC}${LIGHT})${NC} ${LIGHT}PANEL XRAY VMESS${NC}"
echo -e "    ${GREEN} 2${NC}${LIGHT})${NC} ${LIGHT}PANEL XRAY VLESS${NC}"
echo -e "    ${GREEN} 3${NC}${LIGHT})${NC} ${LIGHT}PANEL XRAY TROJAN${NC}"
echo -e "    ${GREEN} 4${NC}${LIGHT})${NC} ${LIGHT}PANEL XRAY SHADOWSOCKS${NC}"
echo -e ""
echo -e " ${YELLOW} -------------------=[${NC} ${RED}OPTIONS MENU${NC} ${YELLOW}]=------------------- ${NC}"
echo -e "    ${GREEN} 5${NC}${LIGHT})${NC} ${LIGHT}ADD SUBDOMAIN HOST FOR VPS${NC}"
echo -e "    ${GREEN} 6${NC}${LIGHT})${NC} ${LIGHT}RENEW CERTIFICATE XRAY${NC}"
echo -e "    ${GREEN} 7${NC}${LIGHT})${NC} ${LIGHT}AUTOBACKUP DATA VPS${NC}"
echo -e "    ${GREEN} 8${NC}${LIGHT})${NC} ${LIGHT}BACKUP DATA VPS${NC}"
echo -e "    ${GREEN} 9${NC}${LIGHT})${NC} ${LIGHT}RESTORE DATA VPS${NC}"
echo -e "   ${GREEN} 10${NC}${LIGHT})${NC} ${LIGHT}LIMIT BANDWITH SPEED SERVER${NC}"
echo -e "   ${GREEN} 11${NC}${LIGHT})${NC} ${LIGHT}CHECK USAGE OF VPS RAM${NC}"
echo -e "   ${GREEN} 12${NC}${LIGHT})${NC} ${LIGHT}REBOOT VPS${NC}"
echo -e "   ${GREEN} 13${NC}${LIGHT})${NC} ${LIGHT}SPEEDTEST VPS${NC}"
echo -e "   ${GREEN} 14${NC}${LIGHT})${NC} ${LIGHT}INFORMATION DISPLAY SYSTEM${NC}" 
echo -e "   ${GREEN} 15${NC}${LIGHT})${NC} ${LIGHT}INFORMATION SCRIPT${NC}"
echo -e "   ${GREEN} 16${NC}${LIGHT})${NC} ${LIGHT}CLEAR LOG VPS${NC}"
echo -e "   ${GREEN} 17${NC}${LIGHT})${NC} ${LIGHT}CEK BANDWIDTH VPS${NC}"
echo -e " ${YELLOW} -------------------------------------------------------- ${NC}"
echo -e "       ${GREEN} x${NC}${LIGHT})${NC} ${LIGHT}EXIT${NC}"
echo -e " ${YELLOW} -------------------------------------------------------- ${NC}"
echo -e " ${YELLOW} ======================================================== ${NC}"
echo -e ""
echo -e "    ${LIGHT} Select From Options ${NC}"
read -p "     [1-17 or type x to exit the menu] : " menu
echo -e ""
case $menu in