# ConfigFiles
Los archivos en este repositorio estan hechos para remplazar otros archivos ya existentes en las carpetas de la aplicacion del script server.
Por eso primero hay que [instalar el script server](https://github.com/bugy/script-server/wiki/Installing-on-virtualenv-(linux)).
Una vez instalado el script server las carpetas van ordenadas de la siguiente manera.
1. La carpeta css se ubica en /scriptserver/web/css
2. La carpeta img se ubica en /scriptserver/web/img
3. El conf.json se ubica en /scriptserver/conf
4. La carpeta scripts se ubica en /scripts pero este lugar puede ser modificado cambiando los archivos .json en la carpeta runners
5. La carpeta runners se ubica en /scriptserver/conf/runners
6. Para que el programa arranque en los reboots hay que agregar al crontab esto: @reboot /work/scriptserver/launcher.py
