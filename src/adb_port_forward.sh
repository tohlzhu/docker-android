#!/bin/sh
set -x

# wait for emulator start
sleep 5

port=8080

# start adb with -a option
adb kill-server
nohup adb -a nodaemon server start > /dev/null 2>&1 &

sleep 2

# let adb start server and go forward
adb devices -l

adb forward tcp:${port} tcp:${port}
adb forward --list

# pause for 5 sec or forever
#read -p "Press enter to continue" -t 5
#read -p "Press enter to continue"
#pause