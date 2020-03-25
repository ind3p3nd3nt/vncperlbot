#!/bin/bash
clear;
echo "Perl VNC ByPass AUTH IRC Bot with SSL";
echo "Made by independent";
echo 'https://github.com/independentcod/PerlIRCSSL_VNCbypass';
read -p "Install required packages? Y or LEAVE BLANK + ENTER" choice
case $choice in
 Y) sudo apt update;
 sudo apt install git libboost-all-dev build-essential python perl libssl-dev masscan -y;
 sudo cpan -fi Mojo::IRC IO::Socket::SSL;;  
esac
./Config;
