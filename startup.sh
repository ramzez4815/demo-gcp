#!/bin/bash
FILE=/home/ubuntu/flock.tmp
/usr/bin/touch $FILE
if [ ! -f "${FILE}" ]; then 
    crontab -l ; echo '*/5 * * * * /snap/bin/gcloud pubsub subscriptions pull task01-subscription --limit=10 --format='\''value(DATA)'\'' > /home/ubuntu/output_`date +%d-%m-%Y_%H:%M:%S`.json ; /snap/bin/gsutil cp /home/ubuntu/output* gs://task01-bucket/ ;  rm -rf /home/ubuntu/output* ' | crontab -
fi 
