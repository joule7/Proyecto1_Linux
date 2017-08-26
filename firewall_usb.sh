#!/bin/bash
#
#firewall_usb.sh
#
echo "Hi $USER!"
echo "You're run : $0 program"
touch WhiteList.txt | touch BlackList.txt
cat /etc/mtab | grep media
