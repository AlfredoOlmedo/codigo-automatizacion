# Notificador de escritorio

#El código está destinado al envío de notificadores de escritorio.
# Usos de la biblioteca del reproductor

from plyer import notification
import time

def desktop_notifier(title, message, timeout=10):
    notification.notify(
        title=title,
        message=message,
        timeout=timeout
    )

if __name__ == "__main__":
    title = "Desktop Notifier"
    message = "Hello! This is a desktop notification."
    
    desktop_notifier(title, message)
    
# Opcional: Puede agregar un retraso si desea que la notificación aparezca después de un tiempo determinado.
# time.sleep(5) # Esto retrasará la notificación 5 segundos.
# Reemplace las variables de título y mensaje con el título y mensaje de notificación que desee.
# El parámetro de tiempo de espera es opcional y establece la duración durante la cual la notificación estará visible (en segundos).
# Guarde el archivo con una extensión .py y ejecútelo. Debería ver una notificación en el escritorio con el título y el mensaje especificados.
# Tenga en cuenta que el comportamiento puede variar según el sistema operativo. Este ejemplo funciona bien en Windows, pero es posible que necesite una configuración adicional para Linux o macOS, según su sistema y su sistema de notificación.