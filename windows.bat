@echo off
title Install_Wxfee25
color 0A

:menu
Cls
echo =======================================================================================================================
echo  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Install_Wxfee25 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
echo =======================================================================================================================
echo.
echo 1) Datos_bloc_de_notas_Wxfee25
echo y) Salir
echo.
set /p opcion="Elige una opcion: "

if "%opcion%"=="1" (
    echo Creando el archivo con el contenido deseado...
    REM Aquí metes el contenido que quieras en el archivo
    echo Ejecutar Windows +R
%temp% / temp / prefech /> Datos_bloc_de_notas_Wxfee25.txt
    
    echo Abriendo bloc de notas...
    start notepad Datos_bloc_de_notas_Wxfee25.txt
    pause
    goto menu
)
if /I "%opcion%"=="y" (
    echo Saliendo...
    exit
)
echo Opcion no encontrada, vuelve a intentar.
pause
goto menu
