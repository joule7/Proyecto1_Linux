#!/bin/bash
#
#Programa firewall_usb.sh
#Autores BalbuDiana & Joule7
#
#Saludo interactivo
zenity --info --text "Hi $USER!  You're run : $0 program"

CONTROL=0
while [ $CONTROL=0 ] ; do
        #Creacion de nuestras listas blanca y negra donde pondremos el nombre de las usb's
        touch WhiteList.txt | touch BlackList.txt
        cat /etc/mtab | grep media >> /dev/null
	#Declaracion de la barible USB
        USB=$(dmesg | tail -n20 | grep ": Serial" | awk '{print $6}' )
        if [ $? -ne 0 ]; then
                CONTROL=0
        else
                CONTROL=1
		zenity --info --text "Se a conectado: $USB" 
		zenity --info --text "RECUERDE QUE EL MONTAJE DE CUALQUIER DISPOSITIVO PUEDE DAÑAR SU EQUIPO :v"; echo $!
                eleccion=$(zenity --entry --text "1)Montar y Ejecutar \n2)Añadir a la lista Blanca \n3)Añadir a la lista Negra \n4)Desmontar" --entry-text "coloque a opion deseada")
                #read eleccion
                	case $eleccion in
				1) echo $USB >> WhiteList.txt
						mount /dev/sdc1
                                                sudo eject /dev/sdc1
						CONTROL=1
						zenity --info --text "El dispositivo se encuentra en la lista blanca"
						exit 0;;
						
				2) echo $USB >> WhiteList.txt
						CONTROL=1
						zenity --info --text "El sipositivo se encuetra en la lista blanca"
						exit 0;;
						
				3) echo $USB >> BlackList.txt
						CONTROL=1
						zenity --error --text "El dispositivo se encuentra en la lista negra"
						exit 0;;
						
				4) echo $USB >> BlackList.txt
						umount /dev/sdc1
						CONTROL=1
						zenity --error --text "El dispositivo se encuentra en la lista negra"
						exit 0;;		
				
				*) echo "opcion invalida";;
			esac
			break;
        fi                 
done
exit 0
