### 2. Crea un workflow CD para el proyecto de frontend - OBLIGATORIO

Crea un nuevo workflow que se dispare manualmente y haga lo siguiente:

* Crear una nueva imagen de Docker
* Publicar dicha imagen en el [container registry de GitHub](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

### Solución:
Segui un poco los pasos para publicar en el container registry, tuve que habilitar dos cosas:
- Personal Access tokens. Aunque este, no estoy seguro que fuera necesario.
- Dar permisos de escritura.
![Permisos](./images/workflow%20permissions.png)

- Dejo el a la action: 
[Github Action: Hangman front cd](https://github.com/franjfgcarmo/gh-lemon-code-2024/blob/main/.github/workflows/hangman-front-cd.yaml)

- Listado de los worklows ejecutados: [Workflows ejecutados](https://github.com/franjfgcarmo/gh-lemon-code-2024/actions/workflows/hangman-front-cd.yaml)

- Link al container registry: [Container registry.](https://github.com/franjfgcarmo/gh-lemon-code-2024/pkgs/container/gh-lemon-code-2024%2Fhangman-front). Como peculiaridad, le añadí la versión corta del commit a al imagen que se genera.