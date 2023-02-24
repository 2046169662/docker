#!/bin/bash
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf &
/usr/local/redis/bin/redis-server /usr/local/redis/bin/redis.conf &
/usr/local/activemq/bin/activemq start &
bash /usr/local/kafka/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties &
bash /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties &
java -jar /root/docker-start.jar