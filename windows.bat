@echo off
title Install_Wxfee25
color 0A

:menu
cls
echo =====================================
echo          Install_Wxfee25
echo =====================================
echo.
echo 1) Guardar 
echo 2) Salir
echo.
set /p opcion="Elige una opcion: "

if "%opcion%"=="1" (
    REM Define la ruta de tu repositorio clonado en el Desktop (ajusta si es necesario)
    set "REPO_PATH=%USERPROFILE%\Desktop\script"

    REM Ir a la carpeta del repositorio
    cd /d "%REPO_PATH%"

    REM Verificar conexión a internet (haciendo ping a github.com)
    ping -n 1 github.com >nul 2>&1
    if errorlevel 1 (
        echo [!] No hay conexion a internet. Los cambios se guardaran localmente.
    ) else (
        echo [*] Conectado a internet. Actualizando GitHub...
        REM Agregar el archivo windows.bat (o usa "git add ." para agregar todos los cambios)
        git add windows.bat

        REM Verificar si hay cambios para commitear
        git diff --cached --quiet
        if errorlevel 1 (
            REM Crear un mensaje de commit con fecha y hora
            for /f "tokens=2 delims==." %%A in ('wmic os get LocalDateTime /value ^| find "="') do set datetime=%%A
            set "mensaje=Auto commit: %datetime%"
            git commit -m "%mensaje%"
            git push origin main
            echo [*] Cambios subidos a GitHub.
        ) else (
            echo [*] No hay cambios pendientes para subir.
        )
    )
    pause
    goto menu
)

if "%opcion%"=="2" (
    exit
)

goto menu
