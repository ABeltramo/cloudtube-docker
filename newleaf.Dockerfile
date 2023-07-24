FROM python:3.11-alpine

WORKDIR /workdir

COPY ./requirements.txt ./requirements.txt

RUN apk --update-cache add build-base libtool autoconf automake rust && \
    pip install -r requirements.txt && \
    apk del build-base libtool autoconf automake rust
    

COPY . .

EXPOSE 3000

CMD python index.py
