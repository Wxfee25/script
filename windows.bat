@echo off
color 0A
:menu
cls
                                        echo ============================
                                        echo      Install_Wxfee25
                                        echo ============================
echo.
echo  1) Abrir Bloc de Notas
echo  2) Mostrar IP
echo  3) Subir Cambios a GitHub
echo  4) Descargar Nmap
echo  5) Salir
echo.
set /p opcion="Elige una opcion: "

if %opcion%==1 (
    echo Abriendo Bloc de Notas...
    start notepad
    pause
    goto menu
)

if %opcion%==2 (
    echo Mostrando IP...
    ipconfig
    pause
    goto menu
)

if %opcion%==5 (
    echo Saliendo...
    exit
)

if %opcion%==4 (
    echo Descargando Nmap (usa winget)...
    :: Si tienes Windows 10 o 11 con winget instalado
    powershell -Command "Start-Process powershell -ArgumentList 'winget install -e --id Insecure.Nmap' -Verb RunAs"
    pause
    goto menu
)

if %opcion%==3 (
    echo Iniciando push a GitHub...
    :: Asegúrate de que Git esté instalado y disponible en tu PATH
    :: Te ubicas en la carpeta del script o donde tengas tus archivos:
    cd C:/Archivos de programa "%~dp0"

    :: Inicializa repositorio si no existe
    git init

    :: Agrega todos los archivos
    git add .

    :: Crea commit
    git commit -m "Commit desde el script"

    :: Cambia la rama principal a 'main'
    git branch -M main

    :: Agrega tu remoto de GitHub (cambia <Wxfee25> y <script> por los tuyos)
    git remote add origin https://github.com/Wxfee25/script.git

    :: Sube a GitHub
    git push -u origin main

    pause
    goto menu
)

echo Opcion invalida, vuelve a intentar.
pause
goto menu
