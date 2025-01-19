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

### Solución
- Se añade archivo de pipeline:
```yaml 
stages:
  - build
  - test
  - docker
  - deploy

default:
  cache:
    paths:
      - .m2/repository/
      - target/

variables:
  MAVEN_CLI_OPTS: "-s settings.xml --batch-mode"
  MAVEN_OPTS: "-Dmaven.repo.local=.m2/repository"

maven:build:
  stage: build
  image: maven:3.9.5-eclipse-temurin-21
  script:
    - mvn $MAVEN_CLI_OPTS compile
  artifacts:
    when: on_success
    paths:
      - target/*.jar

maven:test:
  stage: test
  image: maven:3.9.5-eclipse-temurin-21
  dependencies: []
  script:
    - mvn $MAVEN_CLI_OPTS verify
  artifacts:
    when: on_success
    reports:
      junit: 
        - target/surefire-reports/TEST-*.xml

docker:build:
  stage: docker
  dependencies:
    - maven:build
  before_script:
    - docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
  script:
    - docker build --pull -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA .
    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
  cache: []

deploy:
  stage: deploy
  dependencies: []
  before_script:
    - docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY/$CI_PROJECT_PATH
    - if [[ "$(docker ps -a --filter "name=springapp" --format '{{.Names}}')" == "springapp" ]]; then  docker rm -f springapp; else echo "No existe";  fi
  script:
    - docker run -d --name springapp -p 8082:8080 $CI_REGISTRY/$CI_PROJECT_PATH:$CI_COMMIT_SHA
```
- Se adjunta gif, donde se puede ver como navega por las diferentes stages de la pipeline, la aplicación levantado de springapp en `localhost:8082` y el registry de la imagen de docker.
![](pipeline.gif)