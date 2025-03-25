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
    set "REPO_PATH=C:\Users\Usuario\Desktop\script"

    cd /d "%REPO_PATH%"
    
    git config user.name "Wxfe25"
    git config user.email "Wxfee25@users.noreply.github.com"

    ping -n 1 github.com >nul 2>&1
    if errorlevel 1 (
        echo [!] No hay conexion a internet. Los cambios se guardaran localmente.
    ) else (
        echo [*] Conectado a internet. Actualizando GitHub...
        git add windows.bat

        git diff --cached --quiet
        if errorlevel 1 (

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
