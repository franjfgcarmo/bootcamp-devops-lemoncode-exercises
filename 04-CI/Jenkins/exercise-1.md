### 1. CI/CD de una Java + Gradle - OBLIGATORIO

En el directorio raíz de este [código fuente](https://github.com/Lemoncode/bootcamp-devops-lemoncode/tree/master/03-cd/exercises/jenkins-resources), crea un `Jenkinsfile` que contenga una pipeline declarativa con los siguientes stages:

* **Checkout**. Descarga de código desde un repositorio remoto, preferentemente utiliza GitHub
* **Compile**. Compilar el código fuente utilizando `gradlew compileJava`
* **Unit Tests**. Ejecutar los test unitarios utilizando `gradlew test`

Para ejecutar Jenkins en local y tener las dependencias necesarias disponibles podemos contruir una imagen a partir de [este Dockerfile](https://github.com/Lemoncode/bootcamp-devops-lemoncode/blob/master/03-cd/exercises/jenkins-resources/gradle.Dockerfile)