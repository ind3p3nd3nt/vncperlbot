#!/bin/bash
clear;
echo "Perl VNC ByPass AUTH IRC Bot with SSL";
echo "Made by independent";
echo 'https://github.com/independentcod/PerlIRCSSL_VNCbypass';
read -p "Install required packages? Y or LEAVE BLANK + ENTER" choice
case $choice in
 Y) sudo apt update;
 sudo apt install build-essential python perl libssl-dev masscan libpcap-dev -y;
  curl -L https://cpanmin.us | perl - --sudo App::cpanminus;
 sudo cpanm -fi Digest::MD5 Net::SSLeay IO::Socket::SSL Time::HiRes Mojolicious Mojo::IRC; 
esac
./Config;
