#!/bin/bash

# Configuración de la conexión a la base de datos
DB_HOST="127.0.0.1"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER="postgres"
DB_PASSWORD="1234"

clear
echo -e "\n Zoologico Madrid"
echo -e "\n ALTA ANIMALES"
read -p "\n Indica nombre animal" nombreAnimal
read -p "\n Indica la especie" especie 
read -p "\n Indica la cantidad" cantidad

SQL_QUERY="INSERT INTO animales (nombre,especie,cantidad) VALUES ('$nombreAnimal','$especie',$cantidad)"

# Ejecutar la consulta SQL y guardar los resultados en la variable datos
datos=$(PGPASSWORD=$DB_PASSWORD  psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER  -tA -c "$SQL_QUERY") 

SQL_QUERY="SELECT * FROM animales;"

# Ejecutar la consulta SQL y guardar los resultados en la variable datos
datos=$(PGPASSWORD=$DB_PASSWORD  psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER  -tA -c "$SQL_QUERY") 

# Guardar los datos de la consulta en un archivo txt
echo "$datos" > datos_usuario.txt

# Configurar el separador de campo interno para el carácter '|'
IFS='|' read -ra array <<< "$datos"

# Acceder a los elementos del array
usuarioID="${array[0]}"
nombre="${array[1]}"
edad="${array[2]}"
echo "El id de usuario es: $usuarioID"
echo "El nombre es: $nombre"
echo "La edad es: $edad"

echo '\documentclass{article}' > usuario.tex
# Abrir el archivo LaTeX y comenzar el documento
echo '\begin{document}' >> usuario.tex

# Agregar una sección para "Datos del Usuario"
echo '\section*{Datos del Usuario}' >> usuario.tex
 
# Iniciar un entorno "verbatim" para mantener el formato original de los datos
echo '\begin{verbatim}' >> usuario.tex

# Concatenar el contenido del archivo datos_usuario.txt al archivo LaTeX
cat datos_usuario.txt >> usuario.tex

# Finalizar el entorno "verbatim"
echo '\end{verbatim}' >> usuario.tex

# Agregar una línea en blanco para mejorar el formato del PDF
echo '' >> usuario.tex

# Finalizar el documento LaTeX
echo '\end{document}' >> usuario.tex

# Compilar el archivo LaTeX para generar el PDF
pdflatex usuario.tex

# Limpiar archivos temporales generados durante la compilación
rm usuario.aux usuario.log

# Abrir el archivo PDF resultante
xdg-open usuario.pdf
