El presente repositorio crea una máquina virtual (VPS) la cual se accede mediante terminal web por sshx

ACLARO QUE LAS ACCIONES QUE HAGA CON LA MÁQUINA CREADA A PARTIR DE ESTE REPOSITORIO NO ES DE MI RESPONSABILIDAD, EL QUE DECIDE SI QUIERE INTENTAR COSAS MALAS ES USTED Y USTED MISMO SE HACE RESPONSABLE

Nota aclaratoria antes de la instalación:

1-La máquina virtual es limitada, pero que muy muy limitada, no te sorprendas si alguna tarea en ejecución se detiene

2-Railway te permite tenerlo 24/7 encendido (en estos días, hasta donde sé yo)

3-Sistema operativo alphine (usted si quiere puede cambiar el sistema por el archivo "Dockerfile", obviamente además de otros parámetros) (es recomendable tener alphine, evita la sobrecarga en los procesos)

Proceso de instalación:

1-Has un "fork" de este repositorio

2-Registrate y crea un nuevo proyecto en https://railway.com/

3-Selecciona el repositorio al cual le hiciste "fork" a tu cuenta de github

4-Espera a que se termine el proceso "Build"

5-En el proceso "Deploy" soltará un enlace (algo más o menos parecido a ésto https://sshx.io/s/dJsJjjKiX62936826tDv8rx7j ojo el enlace puede variar) cliquea en el enlace y vas a entrar en la terminal

6-Instala "bash" con ```apk add bash``` desde la misma terminal

7-Ejecuta el sigue comando ```bash start.sh```

8-Regresando al panel del proyecto, copia el enlace del proyecto (si accedes a la página del proyecto debería de aparecer una página en blanco con unas letras dando error)

9-Con el enlace copiado vaya a https://console.cron-job.org/jobs regístrese y cree un cron-job de el enlace del proyecto (ponga para 2 o 5 minutos de revisión y quite la opción de "Desactivar por muchas tareas fallidas" "the cronjob will be disabled because of too many failures"

10-Guarde el cron-job y listo, ya podrá seguir utilizando la máquina virtual mediante el enlace de la terminal
