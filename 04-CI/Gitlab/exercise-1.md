### 1. CI/CD de una aplicación spring - OBLIGATORIO

* Crea un nuevo proyecto en GitLab y un repositorio en el mismo, para la aplicación `springapp`. El código fuente de la misma lo puedes encontrar en este [enlace](https://github.com/Lemoncode/bootcamp-devops-lemoncode/tree/master/03-cd/02-gitlab/springapp).
* Sube el código al repositorio recientemente creado en GitLab.
* Crea una pipeline con los siguientes stages:
  * `maven:build` - En este `stage` el código de la aplicación se compila con [maven](https://maven.apache.org/).
  * `maven:test` - En este `stage` ejecutamos los tests utilizando [maven](https://maven.apache.org/).
  * `docker:build` - En este `stage` generamos una nueva imagen de Docker a partir del Dockerfile suministrado en el raíz del proyecto.
  * `deploy` - En este `stage` utilizamos la imagen anteriormente creada, y la hacemos correr en nuestro local.

* **Pistas**:
  * Utiliza la versión de maven 3.6.3
  * El comando para realizar una `build` con maven: `mvn clean package`
  * El comando para realizar los tests con maven: `mvn verify`
  * Cuando despleguemos la aplicación en local, podemos comprobar su ejecución en: `http://localhost:8080`

En resumen, la `pipeline` de `CI/CD`, debe hacer la build de la aplicación generando los ficheros jar, hacer los tests de maven y finalmente dockerizar la app (el dockerfile ya se proporciona en el repo) y hacer un deploy en local.