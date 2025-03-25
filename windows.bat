@echo off
setlocal
color 0A
REM =====================================
REM Registro Automático en GitHub
REM =====================================
set REPO_DIR=C:\Archivos de programa

REM Obtener nombre de host
for /f "tokens=*" %%i in ('hostname') do set MYHOST=%%i

REM Obtener la primera IPv4 (quitando espacios)
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /c:"IPv4"') do (
    set "MYIP=%%i"
    goto :ipFix
)
:ipFix
for /f "tokens=* delims= " %%i in ("%MYIP%") do set "MYIP=%%i"

echo Registrando dispositivo: %MYHOST% - %MYIP%

REM Entrar a la carpeta del repo
pushd %REPO_DIR%

REM Agregar la info al archivo dispositivos.txt
echo %DATE% %TIME% - Host: %MYHOST%, IP: %MYIP% >> dispositivos.txt

REM Hacer commit y push
git add dispositivos.txt
git commit -m "Registro de %MYHOST% - %MYIP% el %DATE%"
git push

REM Volver a la carpeta original
popd

echo =========================================
echo       Menu de Opciones Gen Z
echo =========================================
echo 1. Abrir Bloc de Notas
echo 2. Mostrar Direccion IP
echo 3. Salir
echo 4. Descargar Nmap
echo =========================================
set /p opcion="Elige una opción: "
