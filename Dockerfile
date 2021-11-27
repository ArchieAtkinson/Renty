FROM ubuntu

RUN apt-get update && apt-get -y install cron && apt-get -y install python3-pip

COPY requirements.txt tmp/requirements.txt

RUN pip3 install -r tmp/requirements.txt

COPY install.py tmp/install.py

RUN python3 tmp/install.py

# Copy auto-run file to the cron.d directory
COPY auto-run /etc/cron.d/auto-run
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/auto-run

# Apply cron job
RUN crontab /etc/cron.d/auto-run
 
# Create the log file to be able to run tail
RUN touch /var/log/renty.log
 
# RUN cron
# Run the command on container startup

CMD tail -f /var/log/renty.log