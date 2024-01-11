#!/bin/bash
lista="1ºESO|2ºESO|3ºESO|4ºESO"

usuario=$(zenity  --forms \
        --title="Cuestionario" \
        --text="Completa el cuestionario" \
        --add-combo="Curso: " --combo-values="$lista" \
        --add-entry="Nombre" \
        --add-entry="Apellidos" \
        --add-calendar="Fecha nacimiento")


IFS="|" read -r -a array <<< "$usuario"
curso="${array[0]}"
nombre="${array[1]}"
Apellidos="${array[2]}"
fecha="${array[3]}"
zenity --info --width=300 --text="C:$curso N:$nombre A:$Apellidos F:$fecha" 

color=$(zenity  --list \
        --text="Selecciona un color" \
        --radiolist \
        --column="" \
        --column="Colores" \
        1 "Azul" 2 "Rojo" 3 "Morado")

zenity --info --width=500 --text="$color"




respuesta=$(zenity --question \
        --title="una pregunta" \
        --text="¿Deseas continuar?" \
        --ok-label="Dale si monstro" \
        --cancel-label="Ni de flais") 

if [[ $respuesta == 0 ]] ; then
    zenity --info --width=500 --text="Pulsaste 0"
else
    zenity --error --title="Pulsaste 1" --text="Pulsaste 1"
fi


