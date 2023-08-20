FROM node:18-slim

WORKDIR /workdir

COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

RUN apt-get update -y && \
    apt-get install -y git python3 build-essential && \
    npm install && \
    apt-get remove -y --purge git python3 build-essential


COPY . .

EXPOSE 10412

CMD npm start
