 	#!/bin/bash
  clear;
  echo "Perl VNC ByPass AUTH IRC Bot with SSL";
  echo "Made by independent";
  echo 'https://github.com/independentcod/PerlIRCSSL_VNCbypass';
  read -p "Install required packages? Y or LEAVE BLANK + ENTER" choice
  case $choice in
   Y) sudo yum install epel-release git python perl-CPAN* boost-devel gpp openssl-devel masscan -y && sudo cpan -fi Digest::MD5 Net::SSLeay IO::Socket::SSL Time::HiRes Mojolicious Mojo::IRC;;  
 esac
git clone https://github.com/independentcod/CCFinder.git;
cd CCFinder/CCFinder-Linux;
g++ ccfinder-linux.cpp -o ccfinder -lboost_filesystem -lboost_system -lboost_iostreams -lboost_regex;
mv ./ccfinder ../../;
cd ../../;
./Config;
