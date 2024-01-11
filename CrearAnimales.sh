#!/bin/bash

# Configuración de la conexión a la base de datos
DB_HOST="127.0.0.1"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER="postgres"
DB_PASSWORD="1234"


lista="Mamifero|Hervivoro|Extraterreste"

Animal=$(zenity  --forms \
        --title="Registro Nuevo Animal" \
        --text="Completa el cuestionario Sobre el animal" \
        --add-combo="Especie: " --combo-values="$lista" \
        --add-entry="Nombre Animal" \
        --add-entry="Cantidad" )


IFS="|" read -r -a array <<< "$Animal"
Especie="${array[0]}"
nombre="${array[1]}"
Cantidad="${array[2]}"

SQL_QUERY="INSERT INTO animales (nombre,especie,cantidad) VALUES ('$nombre','$Especie','$Cantidad')"

# Ejecutar la consulta SQL y guardar los resultados en la variable datos
datos=$(PGPASSWORD=$DB_PASSWORD  psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER  -tA -c "$SQL_QUERY") 

SQL_QUERY="SELECT * FROM animales;"

# Ejecutar la consulta SQL y guardar los resultados en la variable datos
datos=$(PGPASSWORD=$DB_PASSWORD  psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER  -tA -c "$SQL_QUERY") 

echo "$datos" > datos_animales.txt