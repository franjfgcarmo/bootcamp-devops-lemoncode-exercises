## Exercise 1

1. Crear Networkd

```powershell
docker network create lemoncode-challenge
docker network ls
docker network inspect lemoncode-challenge    
```

2. Crear contenedor de mongo 

```shell
#Crear volumen de mongo
docker run --name some-mongo --mount type=volume,source=mongo,target=/data/db -p 27017:27017 -d --network lemoncode-challenge  mongo

docker exec -it some-mongo /bin/bash                                                                                                
root@11acd20a7771:/# ls /data/db

docker volume ls
```

3. Crear imagen de Api.
He puesto varias formas de crear el contenedor, fue un poco iterando y probando. La opción tres sería la buena

```shell

# Opcion Api 1
docker build -t topics-api:1.0.0 .
docker run --name topics-api -d -p 5000:80 --network lemoncode-challenge  topics-api:1.0.0 

#Opcion Api 2
docker build --build-arg CONNECTION_STRING="://some-mongo:27017" -t topics-api:1.0.0 .
docker run --name topics-api -d -p 5000:80 --network lemoncode-challenge  topics-api:1.0.0 

#Opcion Api 3
docker build -t topics-api:1.0.0 .
docker run -e TopicstoreDatabaseSettings__ConnectionString="mongodb://some-mongo:27017" --name topics-api -d -p 5000:80 --network  lemoncode-challenge  topics-api:1.0.0 

```

3. Crear imagen de front.
He puesto varias formas de crear el contenedor, fue un poco iterando y probando. La opción tres sería la buena

```shell
#Opcion Frontend 1
docker build -t topics-frontend:1.0.0 .
docker run --name topics-frontend -d -p 8080:3000 --network lemoncode-challenge  topics-frontend:1.0.0

#Opcion Frontend  2
docker build --build-arg TOPICS_API=topics-api -t topics-frontend:1.0.0 .
docker run --name topics-frontend -d -p 8080:3000 --network lemoncode-challenge  topics-frontend:1.0.0

#Opcion Frontend 3
docker build -t topics-frontend:1.0.0 .
docker run --name topics-frontend -e API_URI=http://topics-api -d -p 8080:3000 --network lemoncode-challenge  topics-frontend:1.0.0
```



# Exercise 2