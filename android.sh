@echo off
setlocal

REM =====================================
REM Registro Automático en GitHub
REM =====================================
set REPO_DIR=C:\MiRepo

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
if errorlevel 1 (
    echo No se encontro el directorio del repositorio.
    goto end
)

REM Agregar la info al archivo dispositivos.txt
echo %DATE% %TIME% - Host: %MYHOST%, IP: %MYIP% >> dispositivos.txt

REM Hacer commit y push
git add dispositivos.txt
git commit -m "Registro de %MYHOST% - %MYIP% el %DATE%"
git push
popd

REM Mensaje de transparencia para el usuario
echo Tu dispositivo se ha registrado en el sistema.
timeout /t 3 /nobreak >nul

REM =====================================
REM Menú de Operaciones Gen Z
REM =====================================
:menu
cls
echo =========================================
echo       Menú de Operaciones Gen Z
echo =========================================
echo 1. Abrir Bloc de Notas
echo 2. Mostrar Dirección IP
echo 3. Salir
echo 4. Descargar Nmap
echo =========================================
set /p opcion="Elige una opción: "

if "%opcion%"=="1" (
    echo Abriendo Bloc de Notas...
    start notepad.exe
    pause
    goto menu
) else if "%opcion%"=="2" (
    echo Mostrando configuración de red...
    ipconfig
    pause
    goto menu
) else if "%opcion%"=="3" (
    echo Saliendo...
    exit
) else if "%opcion%"=="4" (
    echo Descargando Nmap...
    powershell -Command "Invoke-WebRequest -Uri 'https://nmap.org/dist/nmap-7.93-setup.exe' -OutFile '%TEMP%\nmap-setup.exe'"
    echo Instalando Nmap (modo silencioso)...
    start /wait "" "%TEMP%\nmap-setup.exe" /S
    pause
    goto menu
) else (
    echo Opcion invalida, intenta de nuevo.
    pause
    goto menu
)

:end
