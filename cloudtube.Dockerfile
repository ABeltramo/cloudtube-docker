FROM node:15-alpine

WORKDIR /workdir

COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

RUN apk --update --no-cache add git python3 alpine-sdk && \
    npm install && \
    apk del git python3 alpine-sdk

COPY . .

EXPOSE 10412

CMD npm start
