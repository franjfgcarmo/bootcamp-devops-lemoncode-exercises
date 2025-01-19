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

### Solución.

He implementado la solución utilizando la github action de Cypress, mirando la sección de  [Subfolders](https://github.com/cypress-io/github-action?tab=readme-ov-file#subfolders), por otro lado vi que se generaba un video y lo he subido como un artifact a la pipeline, seguí también la documentación de la github action.

- Dejo el link a la action: 
[Github Action: Hangman front cd](https://github.com/franjfgcarmo/gh-lemon-code-2024/blob/main/.github/workflows/hagman-e2e-ci.yaml)

- Listado de los worklows ejecutados: [Workflows ejecutados](https://github.com/franjfgcarmo/gh-lemon-code-2024/actions/workflows/hagman-e2e-ci.yaml)

- Link a la última action ejecutada, donde se puede ver la pipeline, el resultado de los test y el artifact del video: [Action.](https://github.com/franjfgcarmo/gh-lemon-code-2024/actions/runs/12854291067). Como peculiaridad, le añadí la versión corta del commit a al imagen que se genera.