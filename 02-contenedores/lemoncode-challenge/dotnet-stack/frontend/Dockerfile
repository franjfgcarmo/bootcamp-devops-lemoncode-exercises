FROM node:22-alpine AS base

WORKDIR /app

COPY . ./

FROM base AS release

RUN npm install --omit=dev

ARG TOPICS_API="http://topics-api"
ENV API_URI="${TOPICS_API}"

COPY . .

EXPOSE 3000

CMD ["npm", "start"]