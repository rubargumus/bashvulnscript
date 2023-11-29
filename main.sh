#!/bin/bash

sudo su
apt-get update && apt-get full-upgrade && apt-get autoremove
sudo apt install figlet 
clear
echo "url =>"
read url
figlet NUKE TOOLS
echo "You must use Kali for this script." 
echo "
[1] Wordpress Scanning
[2] Security Checks
[3] DNS Enumeration
[4] Directory Scanning
[5] Rapidscan Installation
[6] Searchsploit Exploit Search
[7] Exit
"
read girdi
clear
echo "$girdi"

if [[ "$girdi" == "1" ]]; then
    clear
    echo "Do you have wpscan token? (default=N)"
    read token
    if [[ "$token" == "N" || "$token" == "n" || "$token" == "" ]]; then
        whatweb "$url" 
        wpscan --url "$url" --random-user-agent -e u,vp
    else 
        whatweb "$url" 
        wpscan --url "$url" --random-user-agent -e u,vp --api-token "$token"
    fi

elif [[ "$girdi" == "2" ]]; then
    clear
    whatweb "$url"
    ldb "$url"
    nikto -h "$url"
    dnsenum "$url"
    nmap -sS -sV "$url"
    
elif [[ "$girdi" == "3" ]]; then
    clear
    whatweb "$url"

elif [[ "$girdi" == "4" ]]; then
    clear
    git clone https://github.com/skavngr/rapidscan.git
    cd rapidscan
    chmod 777 *
    python3 rapidscan.py "$url"

elif [[ "$girdi" == "5" ]]; then
    echo "Exiting. See you again."
    clear

elif [[ "$girdi" == "6" ]]; then
    searchsploit "$url"

else 
    echo "Invalid input"
fi
