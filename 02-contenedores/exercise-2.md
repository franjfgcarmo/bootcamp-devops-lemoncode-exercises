## Ejercicio 2
Ahora que ya tienes la aplicación del ejercicio 1 dockerizada, utiliza Docker Compose para lanzar todas las piezas a través de este. Debes plasmar todo lo necesario para que esta funcione como se espera: la red que utilizan, el volumen que necesita MongoDB, las variables de entorno, el puerto que expone la web y la API. Además debes indicar qué comandos utilizarías para levantar el entorno, pararlo y eliminarlo.


## Solución de Ejercicio 1

Link al docker compose: [docker-compose.yml](./lemoncode-challenge/docker-compose.yml)
He creado un [script](./lemoncode-challenge/docker-entrypoint-initdb.d/init-mongo.js) que inicializa la base de datos.

```shell
# levantar el entorno
docker compose up
# Parar el entorno
docker compose stop
# Parar y eliminar el entorno
docker compose down
```

