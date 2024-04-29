# Correo electrónico Manténgase en contacto

import smtplib
from email.mime.text import MIMEText

def send_email(to_email, subject, message):
# Configurar el servidor de correo electrónico y las credenciales
    smtp_server = 'your_smtp_server'
    smtp_port = 587
    smtp_username = 'your_email@gmail.com'
    smtp_password = 'your_email_password'

# Crear una conexión al servidor SMTP
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()
    server.login(smtp_username, smtp_password)

# Crear el contenido del correo electrónico
    msg = MIMEText(message)
    msg['Subject'] = subject
    msg['From'] = smtp_username
    msg['To'] = to_email

# Enviar el correo electrónico
    server.sendmail(smtp_username, to_email, msg.as_string())

# Cerrar la conexión
    server.quit()

# Ejemplo de uso
to_email = 'recipient@example.com'
subject = 'Stay in touch!'
message = 'Hello, let\'s stay in touch!'

send_email(to_email, subject, message)

# Utiliza la biblioteca smtplib
# Asegúrese de reemplazar los valores del marcador de posición (your_smtp_server, your_email@gmail.com y your_email_password) con los detalles reales de su servidor SMTP y sus credenciales de correo electrónico.
# Nota: 
# Tenga cuidado al manipular información confidencial, como credenciales de correo electrónico. 
# A menudo es mejor utilizar variables de entorno o un archivo de configuración para almacenar dicha información de forma segura.