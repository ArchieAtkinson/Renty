FROM arm32v6/python:3.10.1-alpine

RUN apk update && apk add gcc && apk add musl-dev

COPY requirements.txt tmp/requirements.txt

RUN pip3 install -r tmp/requirements.txt

COPY install.py tmp/install.py

RUN python3 tmp/install.py

CMD touch /var/log/renty.log

# CMD python3 /home/src/app/service_runner.py > /var/log/renty.log