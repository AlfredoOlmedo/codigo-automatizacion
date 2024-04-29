# Registro de invitados en código Python

class GuestManager:
    def __init__(self):
        self.guests = {}

    def check_in_guest(self, name, room_number):
        if name in self.guests:
            print(f"{name} is already checked in.")
        else:
            self.guests[name] = room_number
            print(f"{name} checked in to Room {room_number}.")

    def display_guests(self):
        print("\nGuest List:")
        for name, room_number in self.guests.items():
            print(f"{name}: Room {room_number}")

def main():
    guest_manager = GuestManager()

    while True:
        print("\n1. Check-in a guest")
        print("2. Display guest list")
        print("3. Exit")

        choice = input("Enter your choice (1/2/3): ")

        if choice == '1':
            name = input("Enter guest name: ")
            room_number = input("Enter room number: ")
            guest_manager.check_in_guest(name, room_number)
        elif choice == '2':
            guest_manager.display_guests()
        elif choice == '3':
            print("Exiting the guest management system. Goodbye!")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.")

if __name__ == "__main__":
    main()

# Para un mejor caso de uso, cree una base de datos, use un diccionario para almacenar la información de los huéspedes y una función para el proceso de registro
# El código define una clase GuestManager con métodos para registrar invitados y mostrar la lista de invitados.
# La función principal proporciona un menú sencillo para que el usuario interactúe con el sistema de gestión de invitados.
# El programa continuará ejecutándose hasta que el usuario decida salir (opción 3).