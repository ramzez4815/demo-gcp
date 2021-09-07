#!/bin/bash
FILE=/home/ubuntu/flock.tmp
cat > /home/ubuntu/demo_script.sh <<- DEL
#!/bin/bash
UHOME=/home/ubuntu/
GCLOUD=/snap/bin/gcloud
GSUTIL=/snap/bin/gsutil

cd \$UHOME
\$GCLOUD pubsub subscriptions pull task01-subscription --limit=10 --format='value[separator=","](DATA, ACK_ID)' | awk -F , -v message="message.\$(date +%d-%m-%Y_%H:%M:%S).json" '{if(\$1!="") {print \$1 > message} if(\$2!="") {print \$2 > "messageid"}}'

if [ -s \$UHOME/messageid ] ; then
   \$GSUTIL cp message.* gs://task01-bucket/ && cat messageid | xargs -L 1 -I ackid \$GCLOUD pubsub subscriptions ack task01-subscription --ack-ids=ackid
fi

rm -r message*
DEL
if [ ! -f "${FILE}" ]; then 
    echo "*/5 * * * * /home/ubuntu/demo_script.sh" | /usr/bin/crontab 
fi
/usr/bin/touch $FILE
chmod +x /home/ubuntu/demo_script.sh