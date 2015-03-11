#!/bin/bash

if [ ! -d /tmp/zookeeper ]; then
  echo creating zookeeper data dir...
  mkdir /tmp/zookeeper
fi
# echo starting zookeeper 
/java/kafka_2.10-0.8.2.0/bin/zookeeper-server-start.sh /vagrant/config/zookeeper.properties > /tmp/zookeeper.log &
