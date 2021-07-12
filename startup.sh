#!/bin/bash
FILE=/home/ubuntu/flock.tmp
/usr/bin/touch $FILE
VAR="#!/bin/bash \
    cd /home/ubuntu/ \ 
    /snap/bin/gcloud pubsub subscriptions pull task01-subscription --limit=10 --format='value[separator=","](DATA, ACK_ID)' | awk -F , -v message=\"message.$(date +%d-%m-%Y_%H:%M:%S)\" '{if($1!=\"\") {print $1 > message} if($2!=\"\") {print $2 > \"messageid\"}}' ; /snap/bin/gsutil cp message.* gs://task01-bucket/ && cat messageid | xargs -L 1 -I ackid /snap/bin/gcloud pubsub subscriptions ack task01-subscription --ack-ids=ackid
    rm -r message*"
echo '$VAR' > /home/ubuntu/demo_script.sh
if [ ! -f "${FILE}" ]; then 
    echo "*/5 * * * * /home/ubuntu/demo_script.sh" | /usr/bin/crontab 
fi 