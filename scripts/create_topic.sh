#!/bin/bash

if [ $# -gt 0 ]; then
    /java/kafka/bin/kafka-topics.sh --create --zookeeper 127.0.0.1:2181 --replication-factor 1 --partition 1 --topic $1
else
    echo "Usage: create_topic.sh <topic_name>"
fi

