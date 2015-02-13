vagrant-kafka
=============

This is the fork of the https://github.com/eucuepo/vagrant-kafka by Eugenio Cuevas.

Vagrant config to setup a partitioned Apache Kafka installation with clustered Apache Zookeeper

This configuration will start and provision 6 CentOS7 VMs:
* Three Apache Zookeeper hosts configured on cluster
* Three Apache Kafka hosts with one broker each

Each host is provisioned with JDK 8 and Kafka 0.8.2 (compiled against Scala 2.10)

Prerrequisites
-------------------------
* Vagrant (1.7.2)
* VirtualBox (4.3.22)

Setup
-------------------------

To start it up, just git clone this repo and execute ```vagrant up```. Takes a while the first time as it will download all required dependencies for you and provision the VMs. If your host has more than one network interface, the script can ask, which one should be used for the "bridged" networking (first-time run only, but several times - for every VM being created).  

Kafka is installed on ```/java/kafka```

Let's test it!
-------------------------

Login to any host with ```vagrant/vagrant```. Some scripts have been included for convenience:

* ```/vagrant/scripts/create_topic.sh <topic name>```: this is a shortcut to create a topic using three replicas and one partition, executes ```/java/kafka/bin/kafka-topics.sh --create --zookeeper 10.30.3.2:2181 --replication-factor 3 --partition 1 --topic <topic name>```
* Topic details can be listed with ```/usr/local/kafka/scripts/kafka-list-topic.sh --zookeeper 10.30.3.2:2181```
* ```/vagrant/scripts/producer.sh <topic name>```: this will create a console producer, sending output to the topic created before, executes ```/java/kafka/bin/kafka-console-producer.sh --broker-list 10.30.3.10:9092,10.30.3.20:9092,10.30.3.30:9092 --topic <topic name>```
* ```/vagrant/scripts/consumer.sh <topic name>```: this will create a console consumer, getting messages from the topic created before, executes ```/java/kafka/bin/kafka-console-consumer.sh --from-beginning --zookeeper 10.30.3.2:2181 --topic <topic name>```

Now if you input anything on the producer, it will show on the consumer. 






