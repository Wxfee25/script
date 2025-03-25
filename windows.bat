@echo off
title Install_Wxfee25
color 0A
echo =======================================================================================================================
echo      						   Install_Wxfee25
echo =======================================================================================================================
echo.
echo 1)Informacion	
echo y) Salir	
echo.
set /p opcion="Elige una opcion: "

if %opcion%==1 (
    echo Abriendo Bloc de Notas...
    start notepad
    pause
    goto menu
)
if %opcion%==y (
    echo Saliendo...
    exit
)
echo Opcion no encontrado, vuelve a intentar.
pause
goto menu
