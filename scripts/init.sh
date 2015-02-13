#!/bin/bash
#download rpm if not present
if [ ! -f /vagrant/rpm/kafka_2.10-0.8.2.0.tgz ]; then
    echo Downloading kafka...
    wget http://mirror.hosting90.cz/apache/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz -P /vagrant/rpm/
fi

if [ ! -f /vagrant/rpm/jdk-8u31-linux-x64.rpm ]; then
    echo Downloading JDK rpm
    wget -O /vagrant/rpm/jdk-8u31-linux-x64.rpm --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.rpm" 
fi

echo installing jdk and kafka...
rpm -ivh /vagrant/rpm/jdk-8u31-linux-x64.rpm
mkdir /java
tar xzf /vagrant/rpm/kafka_2.10-0.8.2.0.tgz --directory /java
ln -s /java/kafka_2.10-0.8.2.0 /java/kafka
echo done installing jdk and kafka
# chmod scripts
chmod u+x /vagrant/scripts/*.sh
