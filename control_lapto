import os
import socket
import cv2

# Obtener la dirección IP
def get_ip_address():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip_address = s.getsockname()[0]
        s.close()
        return ip_address
    except:
        return "No disponible"

#Acceder a la camara
def access_camera():
    cap = cv2.VideoCapture(0)

    if not cap.isOpened():
        print("No se pudo acceder a la cámara")
        return

    ret, frame = cap.read()
    if ret:
        cv2.imshow('Camera', frame)
        cv2.waitKey(3000)  # 3 segundos
    else:
        print("Error al capturar imagen")

    cap.release()
    cv2.destroyAllWindows()

# Acceder al almacenamiento
def access_storage():
    try:
        storage_path = os.path.expanduser("~")
        return os.listdir(storage_path)
    except:
        return []

# Ejecutar las funciones
ip = get_ip_address()
print(f"Dirección IP: {ip}")

access_camera()

files = access_storage()
print(f"Archivos encontrados: {len(files)} elementos")
