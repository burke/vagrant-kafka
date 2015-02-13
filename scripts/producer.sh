#!/bin/bash

if [ $# -gt 0 ]; then
    /java/kafka/bin/kafka-console-producer.sh --broker-list 10.30.3.10:9092,10.30.3.20:9092,10.30.3.30:9092 --topic $1
else
    echo "Usage: producer.sh <topic_name>"
fi

