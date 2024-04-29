#!/bin/bash
# Script Bash para ordenar archivos en un directorio de mayor a menor tamaño

# Definir el directorio que contiene los archivos.
directory="/path/to/your/directory"

# Navegar al directorio
cd "$directory" || exit

# Comprobar si el directorio existe
if [ ! -d "$directory" ]; then
    echo "Directory not found."
    exit 1
fi

# Listar archivos en el directorio, ordenados por tamaño (el más grande primero)
files_sorted=$(ls -lS | awk '/^-/{print $9}')

# Mover cada archivo a un nuevo directorio en el orden ordenado
sorted_directory="sorted_files"
mkdir -p "$sorted_directory"
count=1

for file in $files_sorted; do
    mv "$file" "$sorted_directory/$count-$file"
    ((count++))
done

echo "Files have been sorted and moved to '$sorted_directory' directory."

# Asegúrese de reemplazar "/ruta/a/su/directorio" con la ruta real al directorio que contiene los archivos que desea ordenar. 
# Este script creará un nuevo directorio llamado archivos_ordenados y moverá los archivos allí, renombrándolos con un prefijo que indique su orden según el tamaño, de mayor a menor.