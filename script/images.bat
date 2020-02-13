@echo off
title Initial Configuration for Management Remote Policies RECSA PERU
mode con cols=150 lines=15
color 0A
@echo "Archivos eliminados"

::Iniciamos las aplicaciones Chrome y sipRecsa
START "Google Chrome" "http://www.recsaperu.com.pe/referidos.html"
@echo "Aplicaciones iniciada"

exit 

