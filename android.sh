#!/usr/bin/env bash
# =====================================
# Registro Automático en GitHub (versión bash)
# =====================================

# REPO_DIR es la ruta de tu repositorio en Termux
REPO_DIR="$HOME/MiRepo"

# Obtener nombre de host
MYHOST="$(hostname)"

# Obtener la primera IPv4 (excluyendo 127.0.0.1)
# Hay muchas formas de hacerlo, aquí una simple:
MYIP="$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1 | head -n 1)"

echo "Registrando dispositivo: $MYHOST - $MYIP"

# Verificar si existe la carpeta del repo y entrar
if [ ! -d "$REPO_DIR" ]; then
    echo "No se encontró el directorio del repositorio."
    exit 1
fi

pushd "$REPO_DIR" >/dev/null

# Agregar la info al archivo dispositivos.txt
echo "$(date) - Host: $MYHOST, IP: $MYIP" >> dispositivos.txt

# Hacer commit y push
git add dispositivos.txt
git commit -m "Registro de $MYHOST - $MYIP el $(date)"
git push

popd >/dev/null

# Mensaje de transparencia para el usuario
echo "Tu dispositivo se ha registrado en el sistema."
sleep 3  # Equivalente a 'timeout /t 3 /nobreak >nul'

# =====================================
# Menú de Operaciones Gen Z (versión bash)
# =====================================
while true
do
    clear  # Equivalente a 'cls'
    echo "========================================="
    echo "     Menú de Operaciones Gen Z"
    echo "========================================="
    echo "1. Abrir Bloc de Notas"
    echo "2. Mostrar Dirección IP"
    echo "3. Salir"
    echo "4. Descargar Nmap"
    echo "========================================="
    read -p "Elige una opción: " opcion

    case "$opcion" in
        1)
            echo "Abriendo editor de texto (nano)..."
            # En Linux/Termux no existe 'notepad.exe'; nano es un editor de texto en terminal
            nano
            # Simulamos una pausa
            read -p "Presiona Enter para continuar..."
            ;;
        2)
            echo "Mostrando configuración de red..."
            # En Windows es 'ipconfig'; en Linux se usa 'ifconfig' (instala net-tools si no lo tienes)
            ifconfig
            read -p "Presiona Enter para continuar..."
            ;;
        3)
            echo "Saliendo..."
            exit 0
            ;;
        4)
            echo "Instalando Nmap..."
            # En Windows se descarga un .exe, en Termux se instala desde pkg (o apt)
            pkg install nmap -y
            read -p "Presiona Enter para continuar..."
            ;;
        *)
            echo "Opción inválida, intenta de nuevo."
            read -p "Presiona Enter para continuar..."
            ;;
    esac
done
