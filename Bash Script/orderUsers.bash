#!/bin/bash
# Solicitar una lista de todos los usuarios

# Definir el archivo de salida
output_file="/path/to/user_list.txt"

# Enumere todos los usuarios y guarde el resultado en el archivo definido
echo "List of users on the system:" > "$output_file"
echo "=============================" >> "$output_file"
cut -d: -f1 /etc/passwd >> "$output_file"
echo "=============================" >> "$output_file"
echo "User list generated on: $(date)" >> "$output_file"

# Código Bash para una lista de los nombres de usuarios del sistema
# Usar Crontab
# Crear archivo toque user_list.sh
# Guarde el guión
# Hazlo ejecutable, chmod +x user_list.sh
# Utilice Crontab para programar el script crontab -e
# En Crontab agregue la línea 0 0 * * 0 /path/to/user_list.sh
# Este trabajo cron ejecutará el script /path/to/user_list.sh todos los domingos a medianoche (00:00), si es necesario ajuste la ruta al script