FROM node:22-alpine

WORKDIR /app

COPY . ./

ENV NODE_ENV=production

#Instalo las dependencias de mi aplicación, ejecutando el comando npm install
RUN npm install --omit=dev

#Copio el resto de los archivos en el directorio /app
COPY . .

ARG TOPICS_API="http://topics-api"
ENV API_URI="${TOPICS_API}"

#Añado como metadato el puerto por el que escucha mi aplicación
EXPOSE 3000

#Añado otro metadato más que es qué comando se ejecutará cuando se genere un contenedor de esta imagen
CMD ["npm", "start"]