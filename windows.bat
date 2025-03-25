@echo off
title Install_Wxfee25
color 0A

:menu
Cls
echo =======================================================================================================================
echo                        Install_Wxfee25
echo =======================================================================================================================
echo.
echo 1) Datos_bloc_de_notas_Wxfee25
echo y) Salir
echo.
set /p opcion="Elige una opcion: "

if %opcion%==1 (
    echo Creando archivo.txt con el contenido...
echo  ejecuta Windows+R
%temp% / temp / prefech /

> Limpiar_basuras_winds_Iso.txt
    echo Abriendo Limpiar_basuras_winds_Iso.txt Abriendo...
    start notepad Limpiar_basuras_winds_Iso.txt
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
