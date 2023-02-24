FROM centos

LABEL MAINTAINER=fushixin<2046169662@qq.com>

ENV LANG C.UTF-8

# Java
ADD jdk-8u361-linux-x64.tar.gz /usr/local

RUN mv /usr/local/jdk1.8.0_361 /usr/local/java

ENV JAVA_HOME /usr/local/java

ENV JRE_HOME /usr/local/java/jre

ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$PATH

# Update yum
WORKDIR /etc/yum.repos.d/

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum makecache && yum -y update && yum install -y gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel make

# Nginx
ADD nginx-1.22.1.tar.gz /opt

WORKDIR /opt/nginx-1.22.1

RUN ./configure --prefix=/usr/local/nginx --with-http_ssl_module --without-http_gzip_module && make && make install

# Redis
ADD redis-7.0.5.tar.gz /opt

WORKDIR /opt/redis-7.0.5

RUN make && make install PREFIX=/usr/local/redis

# ActiveMQ
ADD apache-activemq-5.16.5-bin.tar.gz /usr/local

RUN mv /usr/local/apache-activemq-5.16.5 /usr/local/activemq

# Kafka
ADD kafka_2.13-3.3.1.tgz /usr/local

RUN mv /usr/local/kafka_2.13-3.3.1 /usr/local/kafka

# Project
ADD docker-start.jar /root

# Clear
RUN rm -f /usr/local/jdk-8u351-linux-x64.tar.gz /opt/nginx-1.22.1.tar.gz /opt/redis-7.0.5.tar.gz /usr/local/apache-activemq-5.16.5-bin.tar.gz /usr/local/kafka_2.13-3.3.1.tgz

# Run
COPY docker-entrypoint.sh /root

RUN chmod +x /root/docker-entrypoint.sh

ENTRYPOINT ["sh","/root/docker-entrypoint.sh"]

WORKDIR /root
