#!/bin/bash
clear;
echo "Perl VNC ByPass AUTH IRC Bot with SSL";
echo "Made by independent";
echo 'https://github.com/independentcod/PerlIRCSSL_VNCbypass';
read -p "Install required packages? Y or LEAVE BLANK + ENTER" choice
case $choice in
Y) sudo yum install epel-release git python3-devel openssl-devel libpcap-devel perl-CPAN* -y;
sudo yum groupinstall "Development Tools" -y;
git clone https://github.com/robertdavidgraham/masscan.git;
cd masscan;
make -j8;
sudo make install;
cd ..;
perl -MCPAN -e install CPAN;
perl -MCPAN -e reload CPAN;
sudo cpan -fi Digest::MD5 Net::SSLeay IO::Socket::SSL Time::HiRes Mojolicious Mojo::IRC Net::Address::IP::Local; 
esac
./Config;
