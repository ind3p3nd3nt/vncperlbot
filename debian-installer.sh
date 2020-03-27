#!/bin/bash
clear;
echo "Perl VNC ByPass AUTH IRC Bot with SSL";
echo "Made by independent";
echo 'https://github.com/independentcod/PerlIRCSSL_VNCbypass';
read -p "Install required packages? Y or LEAVE BLANK + ENTER" choice
case $choice in
 Y) sudo apt update;
 sudo apt install python perl libssl-dev masscan libfreerdp-dev libssh-dev libpostgresql-ocaml-dev libsmbclient-dev -y;
 git clone https://github.com/vanhauser-thc/thc-hydra.git;
 cd thc-hydra;
 ./configure;
 make;
 sudo make install;
 cd ..;
 sudo cpan -fi Mojo::IRC IO::Socket::SSL;;  
esac
./Config;
