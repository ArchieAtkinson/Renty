FROM ubuntu

RUN apt-get update && apt-get -y install python3-pip

COPY requirements.txt tmp/requirements.txt

RUN pip3 install -r tmp/requirements.txt

COPY install.py tmp/install.py

RUN python3 tmp/install.py

CMD touch /var/log/renty.log

# CMD python3 /home/src/app/service_runner.py > /var/log/renty.log