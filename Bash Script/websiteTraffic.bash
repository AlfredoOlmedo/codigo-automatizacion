#!/bin/bash
#Seguimiento del tráfico del sitio web

# Ruta al archivo de registro de acceso de Apache
LOG_FILE="/var/log/apache2/access.log"

# Comprobar si el archivo de registro existe
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Apache access log file not found!"
    exit 1
fi

# Extraer direcciones IP y contar solicitudes
traffic_data=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr)

# Print traffic data
echo "Website Traffic Report:"
echo "-----------------------"
echo "IP Address    | Requests"
echo "-----------------------"
echo "$traffic_data"

# Script Bash que rastrea el tráfico del sitio web analizando el registro de acceso de un servidor web.

# Guardar el Script
# Hazlo ejecutable chmod +x script.sh
# Ajustar el archivo de registro en Apache, Nginx en el servidor web
# Nota:
# Necesitara un servidor Apache, Nginx u otro servidor web, y debe configurarse para que funcione correctamente. 
# Funciona mediante se centra en contar el número de solicitudes por dirección IP única.