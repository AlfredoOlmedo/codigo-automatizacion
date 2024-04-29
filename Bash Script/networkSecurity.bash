#!/bin/bash
# Escaneos de seguridad de red y monitoreo de actividad de bots

# Comprobar si el script se ejecuta con privilegios de root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Definir variables
SCAN_OUTPUT="network_scan.txt"
BOT_LOG="bot_activity.log"

# Definir variables
perform_network_scan() {
    echo "Performing network scan..."
    nmap -sV -O -oN "$SCAN_OUTPUT" localhost
    echo "Network scan completed. Results saved in $SCAN_OUTPUT"
}

# Función para monitorear la actividad del bot.
monitor_bot_activity() {
    echo "Monitoring bot activity..."
    echo "Timestamp    Source IP       Destination IP  Protocol" > "$BOT_LOG"
    while true; do
        netstat -ntp | awk '$NF~/ESTABLISHED|LISTEN/ && $4!~/127.0.0.1|::1/' | awk '{print strftime("%Y-%m-%d %H:%M:%S"), $5, $4, $1}' >> "$BOT_LOG"
        sleep 60  # Ajuste el intervalo según sea necesario
    done
}

# Menú principal
while true; do
    echo "Select an option:"
    echo "1. Perform network security scan"
    echo "2. Monitor bot activity"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            perform_network_scan
            ;;
        2)
            monitor_bot_activity
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select again."
            ;;
    esac
done

# Crea un archivo
# Nombralo
# Otorga permisos
# Para ejecutarlo necesitarás usar privilegios de root SUDO
# Aviso:
# Previamente necesitas instalar Nmap
# Script Bash que realiza análisis de seguridad de la red usando nmap y monitorea la actividad del bot usando netstat. 
# Este script requerirá privilegios elevados para ejecutarse (sudo).
# Este script presenta un menú simple que le permite elegir entre realizar un análisis de seguridad de la red, monitorear la actividad del bot o salir del script. 
# Ajuste las opciones y configuraciones según sea necesario para satisfacer sus requisitos específicos.