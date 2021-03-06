FROM node:15-alpine

WORKDIR /workdir

COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

RUN npm install

COPY . .

# Add default config file
RUN echo 'website_origin = "http://127.0.0.1:3000"' > configuration.py
EXPOSE 10412

CMD npm start
