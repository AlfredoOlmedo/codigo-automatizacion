#!/bin/bash
# Script para enviar un correo electrónico cuando la conexión a Internet está por debajo del umbral especificado

# Definir el host objetivo al que hacer ping
target_host="example.com"

# Haga ping al host de destino una vez y capture la salida
ping_result=$(ping -c 1 $target_host)

# Extraer el tiempo de ida y vuelta (RTT) de la salida del ping
rtt=$(echo "$ping_result" | grep -oP "time=\K[\d.]+")

# Umbral de baja latencia en milisegundos
threshold=50

# Comprobar si RTT no está vacío (es decir, si el ping fue exitoso)
if [ -n "$rtt" ]; then
    echo "Latency to $target_host is $rtt ms"
    
# Comprobar si la latencia está por debajo del umbral
if (( $(echo "$rtt < $threshold" | bc -l) )); then
    echo "Latency is below threshold. Sending email."
        
# Configuración de correo electrónico
    recipient="your_email@example.com"
    subject="Low Latency Alert"
    body="The latency to $target_host is $rtt ms, which is below the threshold of $threshold ms."

# Enviar correo electrónico
    echo "$body" | mail -s "$subject" "$recipient"
fi
else
    echo "Failed to measure latency to $target_host"
fi
# Necesitará tener acceso a un servidor SMTP; puede usar el comando Correo electrónico para este propósito.
#Reemplazar your_emai@example.com
#Este script enviará un correo electrónico si la latencia medida al host de destino está por debajo del umbral especificado (50 milisegundos en este ejemplo).
#Ajuste el valor del umbral según sea necesario
