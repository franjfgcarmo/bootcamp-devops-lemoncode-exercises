### 3. Crear un nuevo repositorio, que contenga una pipeline, que clone otro proyecto, springapp anteriormente creado - OPCIONAL

Relizar de las siguientes maneras:
  
* **Con el método de CI job token**
  * ¿Qué ocurre si el repo que estoy clonando no estoy cómo miembro?

> Pista: https://docs.gitlab.com/ee/ci/jobs/ci_job_token.html

* **Con el método deploy keys**
  * Crear deploy key en el repo springapp y poner solo lectura
  * Crear pipeline que use la deploy key para clonar el repo

 > Pista: https://docs.gitlab.com/ee/ci/ssh_keys/