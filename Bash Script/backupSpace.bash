#!/bin/bash
# Espacio de respaldo
# Script simple para crear una copia de seguridad de un directorio

# Definir directorios de origen y destino
source_dir="/path/to/source"
destination_dir="/path/to/destination"

# Crear marca de tiempo para la carpeta de respaldo
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Crear carpeta de respaldo con marca de tiempo
backup_folder="$destination_dir/backup_$timestamp"
mkdir -p "$backup_folder"

# Copiar el contenido del directorio de origen a la carpeta de respaldo
cp -r "$source_dir"/* "$backup_folder"

# Mostrar mensaje de éxito
echo "Backup completed successfully. Backup stored in: $backup_folder"

# Reemplace /ruta/al/fuente y /ruta/al/destino con las rutas de su directorio de origen (el que desea respaldar) y el directorio de destino (donde desea almacenar la copia de seguridad)
# Guarde el guión
# Hazlo ejecutable chmod +x file.sh