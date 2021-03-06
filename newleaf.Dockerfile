FROM python:3.9-alpine

WORKDIR /workdir

COPY ./requirements.txt ./requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 3000

CMD python index.py
