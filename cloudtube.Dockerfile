FROM node:20-alpine

WORKDIR /workdir

COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

# better-sqlite3 needs node-gyp in order to compile:
# see: https://github.com/WiseLibs/better-sqlite3/issues/1027#issuecomment-1621200576
RUN apk --update --no-cache add git python3 build-base alpine-sdk && \
    npm install -g node-gyp \
    npm install && \
    apk del git python3 alpine-sdk build-base

COPY . .

EXPOSE 10412

CMD npm start
