#!/bin/bash
mypasswd="Secreto"
mycontador=3 

clear
echo -e "\nAPLICACION LOGIN"
read -p "Dime tu nombre:" nombre 
echo -e "Hola $nombre"

while [[ true ]] ;do
    read -p "indica la contraseña" passwd
    if [[ $mypasswd != $passwd ]]; then 
        mycontador=$(( mycontador-1 ))
        echo -e "\nHas fallado"
        read -n 1 -p "Pulsa una tecla ....." 

        if [[ $mycontador -eq 0 ]]; then
            read -n 1 -p "Numero de intentos sobrepasado" 
            break
        fi


    else
        read -n 1 -p "muy bien $nombre, gracias por venir" 
        break
    fi
    clear
done
