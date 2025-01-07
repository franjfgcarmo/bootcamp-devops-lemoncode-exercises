### 1. Crea un workflow CI para el proyecto de frontend - OBLIGATORIO

Copia el directorio [.start-code/hangman-front](https://github.com/Lemoncode/bootcamp-devops-lemoncode/tree/master/03-cd/03-github-actions/.start-code/hangman-front) en el directorio raíz del mismo repositorio que usaste para las clases de GitHub Actions. Si no lo creaste, crea un repositorio nuevo.

Después crea un nuevo workflow que se dispare cuando haya cambios en el proyecto `hangman-front` y exista una nueva pull request (deben darse las dos condiciones a la vez). El workflow ejecutará las siguientes operaciones:

* Build del proyecto de front
* Ejecutar los unit tests

### Solución

- Se deje el link a la solución del problema: [Hangman-fron-CI](https://github.com/franjfgcarmo/gh-lemon-code-2024/blob/main/.github/workflows/hangman-front-ci.yaml)

- También se deje el link a la [Pull request](https://github.com/franjfgcarmo/gh-lemon-code-2024/pull/9) que se utilizo para probar que se lanzaba la github action.

- También dejo el link al  [workflow](https://github.com/franjfgcarmo/gh-lemon-code-2024/actions/workflows/hangman-front-ci.yaml), donde se puede ver los workflow ejecutados.
