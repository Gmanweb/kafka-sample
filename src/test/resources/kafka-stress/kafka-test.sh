#!/bin/bash

if [ -z "$KAFKA_HOME" ] 
then
    KAFKA_HOME=/cygdrive/d/apache/kafka_2.11-0.9.0.1/
fi

if [ -z "$KAFKA_BIN" ] 
then
    KAFKA_BIN=$KAFKA_HOME/windows/bin
fi

HOST=ec2-52-91-88-55.compute-1.amazonaws.com
TOPIC=test-01
KAFKA_CONSUMER=$(ls $KAFKA_BIN/kafka-console-consumer.*)
KAFKA_PRODUCER=$(ls $KAFKA_BIN/kafka-console-producer.*)


function producer() {
    COUNT=0

    while [ $COUNT -le 1000 ]
    do
        echo "Message $COUNT" | $KAFKA_PRODUCER --broker-list $HOST:9092 --topic $TOPIC
    done
    
}

function consumer() {
    $KAFKA_CONSUMER --topic $TOPIC --zookeeper $HOST:2181 > /tmp/messages.log
}

> /tmp/messages.log
consumer &
CONSUMER_PID=$!

producer

sleep 10
echo Waiting

kill $CONSUMER_PID 2>/dev/null

wc /tmp/messages.log

