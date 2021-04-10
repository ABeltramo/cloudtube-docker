FROM python:3.9-alpine

WORKDIR /workdir

COPY ./requirements.txt ./requirements.txt

RUN apk --update-cache add build-base libtool autoconf automake && \
    pip install -r requirements.txt && \
    apk del build-base libtool autoconf automake
    

COPY . .

EXPOSE 3000

CMD python index.py
