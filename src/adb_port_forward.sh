#!/bin/sh
set -x

# start adb with -a option
#adb kill-server
#nohup adb -a -P 5037 nodaemon server start > /dev/null 2>&1 &
nohup adb kill-server &&  adb -a nodaemon server start > /dev/null 2>&1 &
sleep 2

# let adb start server and go forward
adb devices -l
sleep 1

port=8080
adb forward tcp:${port} tcp:${port}
sleep 1

adb forward --list

# pause for 5 sec or forever
#read -p "Press enter to continue" -t 5
#read -p "Press enter to continue"
#pause

