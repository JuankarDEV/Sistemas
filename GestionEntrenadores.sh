#!/bin/bash

# Configuración de la conexión a la base de datos
DB_HOST="127.0.0.1"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER="postgres"
DB_PASSWORD="1234"


listaRegion="Kanto|Johto|Hoenn|Sinnoh|Teselia|Unova|Kalos|Alola|Galar|Paldea"

Entrenador=$(zenity  --forms \
        --title="REDGISTRO NUEVO ENTRENADOR" \
        --text="COMPLETA EL FROMULARIO CON TU INFORMACION" \
        --add-entry="Nombre Entrenor" \
        --add-combo="Region: " --combo-values="$listaRegion")


respuesta=$?
if [[ $respuesta == 0 ]]; then
    IFS="|" read -r -a array <<< "$Entrenador"
    nombre="${array[0]}"
    region="${array[1]}"
    SQL_QUERY="INSERT INTO entrenadores (nombre,region) VALUES ('$nombre','$region')"
    # Ejecutar la consulta SQL y guardar los resultados en la variable datos
    datos=$(PGPASSWORD=$DB_PASSWORD  psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER  -tA -c "$SQL_QUERY") 
    echo"$?"
else
    zenity --error --text="operacion cancelada"
fi




