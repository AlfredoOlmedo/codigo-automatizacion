# Automatizar el envío de correos electrónicos de cumpleaños

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication
import datetime

def send_birthday_email(receiver_email, subject, body, attachment_path=None):
# Tus credenciales de Gmail
    sender_email = "your_email@gmail.com"
    sender_password = "your_email_password"

# Configurar el MIME
    message = MIMEMultipart()
    message['From'] = sender_email
    message['To'] = receiver_email
    message['Subject'] = subject

# Adjuntar cuerpo al correo electrónico
    message.attach(MIMEText(body, 'plain'))

# Adjuntar archivo opcional
    if attachment_path:
        with open(attachment_path, "rb") as attachment:
            part = MIMEApplication(attachment.read(), Name="birthday_wish.pdf")
        part['Content-Disposition'] = f'attachment; filename="{attachment_path}"'
        message.attach(part)

# Conectarse al servidor de Gmail
    with smtplib.SMTP('smtp.gmail.com', 587) as server:
        server.starttls()
        server.login(sender_email, sender_password)

# Enviar correo electrónico
        server.sendmail(sender_email, receiver_email, message.as_string())

if __name__ == "__main__":
# Ejemplo: enviar un correo electrónico de cumpleaños
    today = datetime.date.today()
    birthday_person_email = "birthday_person@example.com"
    email_subject = "Happy Birthday!"
    email_body = f"Dear Birthday Person,\n\nHappy Birthday! Wishing you a fantastic day filled with joy and celebration.\n\nBest Regards,\nYour Name"

    send_birthday_email(birthday_person_email, email_subject, email_body)

# Usa la biblioteca smtplib
# Asegúrese de reemplazar "your_email@gmail.com" y "your_email_password" con sus credenciales de Gmail. 
# Tenga en cuenta que no se recomienda utilizar su contraseña de correo electrónico directamente en el código por razones de seguridad. 
# Es posible que desee utilizar una contraseña específica de la aplicación u OAuth para la autenticación.
# Además, personalice email_body y email_subject según sus requisitos.
# Si tiene un archivo adjunto para enviar, proporcione la ruta del archivo a adjunto_path.