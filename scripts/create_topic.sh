#!/bin/bash

if [ $# -gt 0 ]; then
    /java/kafka/bin/kafka-topics.sh --create --zookeeper 10.30.3.2:2181 --replication-factor 3 --partition 1 --topic $1
else
    echo "Usage: create_topic.sh <topic_name>"
fi

