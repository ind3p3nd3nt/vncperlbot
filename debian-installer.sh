#!/bin/bash
clear;
echo "Perl VNC ByPass AUTH IRC Bot with SSL";
echo "Made by independent";
echo 'https://github.com/independentcod/PerlIRCSSL_VNCbypass';
read -p "Install required packages? Y or LEAVE BLANK + ENTER" choice
case $choice in
 Y) sudo apt-get update;
 sudo apt-get install build-essential python3-dev perl libssl-dev masscan libpcap-dev cpan-listchanges cpanminus cpanoutdated libcpan-. -y;
perl -MCPAN -e install CPAN;
perl -MCPAN -e reload CPAN;
sudo cpan -fi Mojo::IRC IO::Socket::SSL Net::Address::IP::Local; 
esac
./Config;
