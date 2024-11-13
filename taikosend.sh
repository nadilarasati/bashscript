#!/bin/bash
git reset --hard HEAD && git pull
sleep 3
rm start.js
sleep 1
read -p "Submit Account: " akun_code
wget https://raw.githubusercontent.com/gnavira/taikoschedule/refs/heads/main/notrun/"$akun_code"/start.js
sleep 3
clear
node send.js
sleep 3
clear
node start.js
