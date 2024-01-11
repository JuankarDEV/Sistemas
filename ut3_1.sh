#!/bin/bash
    despedida(){
        clear
        echo -e "\gracias por usar nuetra aplicacion\n" 
    }
    buscarNumero(){
        while [[ $numero_adivinar -ne $numero_aleatorio && $intentos -gt 1 ]]; do
            intentos=$(( intentos-1 ))
            fallos=$(( fallos+1 ))
            echo -e "Opsss has fallado" $fallos " veces"
            echo -e "te quedan:" $intentos "intentos"
            if [[ $numero_aleatorio -gt $numero_adivinar ]]; then
                echo -e "El numero que buscas es mayor " 
            elif [[ $numero_aleatorio -lt $numero_adivinar ]]; then 
                echo -e "El numero que buscas es menor " 
            fi
                read -p "Indica otro numero: " numero_adivinar
                clear
        done
            if [[ $intentos -eq 1 ]]; then
            echo "HAS PERDIDO, EL NUMERO BUSCADO ERA:" $numero_aleatorio
            read -n 1 -p "Pulsa para volver al menu" 
            clear
            fi
    }

    clear
    read -p "Dime tu nombre:" nombre 
    echo -e "Hola $nombre"
    clear 
    
while [[ true ]]; do
    echo -e "APLICACIONES ERCILLA\n\n " 
    echo -e "1. Adivinar el numero" 
    echo -e "2. Salir "

    read -n 1 -p "Elige una opcion:" opcion
    clear 
    if [[ $opcion == "1" ]]; then
        numero_aleatorio=$(( 1+RANDOM % 100 ))
        intentos=5
        fallos=0
        echo -e "ADIVINA EL NUMERO \n"
        echo -e "$numero_aleatorio"
        read -p "Indica un numero: " numero_adivinar
        buscarNumero
        if [[ $numero_aleatorio -eq $numero_adivinar ]]; then
            echo -e "HAS GANADO"
            read -n 1 -p "Pulsa para volver al menu" 
            clear
            continue
        fi

        
    elif [[ $opcion == "2" ]]; then
        echo -e "Deseas salir " 
        read -n 1 -p "1.S  2 N" opcion2
        clear 
        if [[ $opcion2 == "S"  || $opcion2 == "s" ]]; then
            
            break
        elif [[ $opcion2 == "N" || $opcion2 == "n" ]]; then
            continue
        else 
            read -n 1 -p "Introduce una opcion valida"
            clear
        fi
    else 
        read -n 1 -p "no has pulsado una opcion correcta "
    fi

done