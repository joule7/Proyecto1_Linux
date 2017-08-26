#!/bin/bash
#
#firewall_usb.sh
#
echo "Hi $USER!"
echo "You're run : $0 program"
touch WhiteList.txt | touch BlackList.txt
cat /etc/mtab | grep media

#Voy a comentar lo que creo se debe borrar, en el caso de que me equivocara en alguna línea me dices, va?

CONTROL=0
#PLACE="/home/.USBDRIVES"

#mkdir $PLACE
#chmod 777 -R $PLACE

while [ $CONTROL=0 ] ; do
        cat /etc/mtab | grep media >> /dev/null
        if [ $? -ne 0 ]; then
                CONTROL=0
        else
                CONTROL=1
                for USBDEV in `df | grep media | awk -F / {'print $5'}` ;
                do
                
                        echo "Are you sure that you want to mount this drive?"
                        echo "If you say yes, enter 1"
                        echo "If you say no, enter 2"
                        read opcion
                        if [opcion==1]; then
                                ##montamos el disco
                        else
                                if [opcion==2]; then 
                                        echo "The drive isn't going to be mount, it will be at the bleck list"
                                        else
                                                echo "Invalid opcion, you should try again"
                                                exit 0
                                    
                                 
#                        USBSIZE=`df | grep $USBDEV | awk {'print $2'}`
#                        if [ $USBSIZE -lt 15664800 ]; then
 #                               USBNAME=`echo $USBDEV | awk -F / {'print $3'}`
#                                mkdir $PLACE/$USBNAME
#                                rsync /media/$USBNAME/ $PLACE/$USBNAME/ -ahv --\
#include-from=/opt/bash/usb-spy.files --exclude=*.* --prune-empty-dirs
                        fi
                done
        fi
        sleep 5
done

exit 0

