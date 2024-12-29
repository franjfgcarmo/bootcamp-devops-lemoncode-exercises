### 3. Crea un workflow que ejecute tests e2e - OPCIONAL

Crea un workflow que se lance de la manera que elijas y ejecute los tests e2e que encontrarás en [este enlance](https://github.com/Lemoncode/bootcamp-devops-lemoncode/tree/master/03-cd/03-github-actions/.start-code/hangman-e2e/e2e). Puedes usar [Docker Compose](https://docs.docker.com/compose/gettingstarted/) o [Cypress action](https://github.com/cypress-io/github-action) para ejecutar los tests.

#### Como ejecutar los tests e2e

* Tanto el front como la api se deben estar corriendo

```bash
docker run -d -p 3001:3000 hangman-api
docker run -d -p 8080:8080 -e API_URL=http://localhost:3001 hangman-front
```

* Los tests se ejecutan desde el directorio `hangman-e2e/e2e` haciendo uso del comando `npm run open`

```bash
cd hangman-e2e/e2e
npm run open
```