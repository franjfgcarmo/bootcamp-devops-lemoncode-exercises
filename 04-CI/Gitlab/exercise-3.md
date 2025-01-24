### 3. Crear un nuevo repositorio, que contenga una pipeline, que clone otro proyecto, springapp anteriormente creado - OPCIONAL

Relizar de las siguientes maneras:
  
* **Con el método de CI job token**
  * ¿Qué ocurre si el repo que estoy clonando no estoy cómo miembro?

> Pista: https://docs.gitlab.com/ee/ci/jobs/ci_job_token.html

* **Con el método deploy keys**
  * Crear deploy key en el repo springapp y poner solo lectura
  * Crear pipeline que use la deploy key para clonar el repo

 > Pista: https://docs.gitlab.com/ee/ci/ssh_keys/

 ### Solución

#### Usuarios del proyecto springapp
![alt text](image-10.png)

#### Usuario del proyecto clone springapp
 ![alt text](image-12.png)

* **Con el método de CI job token**

El usuario `exercise-2`, es el que uso para clonar los repo.

 ```yaml
 stages:
  - clone

clone-springapp:
  stage: clone
  before_script:
   - apk update
   - apk add git
  script:
    - echo "Cloning springapp repository..."
    - "git clone http://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.local:8888/bootcamp/springapp.git"
 ```
**Permite clonar el repositorio**
 ```shell
 OK: 42 MiB in 72 packages
$ echo "Cloning springapp repository..."
Cloning springapp repository...
$ git clone http://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.local:8888/bootcamp/springapp.git
Cloning into 'springapp'...
Job succeeded
 ```

 * **Con el método deploy keys**
 1. Creamos por lineas de comando las clave ssh `ssh-keygen -t ed25519 -C "exercise-3"` **sin passphrase**
 2. Añadimos como una variable de la CI/CD al proyecto `clone Springapp`.
![clone springapp](image-9.png)

 3. Creamos una deploy key el el proyecto Springapp

![Pub](image-11.png)
 ```yaml
 stages:
  - clone-ssh
  
clone-springapp-from-ssh:
  image: debian:latest
  stage: clone-ssh
  before_script:
    - apt-get update
    - apt-get install -y git openssh-client
    - 'command -v ssh-agent >/dev/null || ( apt-get update -y && apt-get install openssh-client -y )'
    - eval $(ssh-agent -s)
    - chmod 400 "$SSH_PRIVATE_KEY"
    - ssh-add "$SSH_PRIVATE_KEY"
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
    - ssh-keyscan -H gitlab.local >> ~/.ssh/known_hosts
  script:
    - echo "Cloning springapp repository..."
    - "git clone git@gitlab.local:bootcamp/springapp.git"   
 ```
**Me permite clonar el repositorio**
 ```shell
Cloning springapp repository...
$ git clone git@gitlab.local:bootcamp/springapp.git
Cloning into 'springapp'...
remote: 
remote: INFO: Your SSH key is expiring soon. Please generate a new key.
remote: 
Cleaning up project directory and file based variables
00:01
Job succeeded
 ```

