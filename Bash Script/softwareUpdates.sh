#!/bin/bash
# Actualizaciones de software

# Actualizar listas de paquetes
echo "Updating package lists..."
sudo apt update

# Actualizar paquetes instalados
echo "Upgrading installed packages..."
sudo apt upgrade -y

# Limpiar
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean

echo "Software update complete."

# El script se crea para actualizar, mejorar y, si es necesario, eliminar y limpiar versiones anteriores del paquete.
# Guarde este script en un archivo, por ejemplo, update.sh, hágalo ejecutable con chmod +x update.sh y luego podrá ejecutarlo con ./update.sh. 
#Este script actualizará las listas de paquetes, actualizará los paquetes instalados y luego limpiará los archivos innecesarios.