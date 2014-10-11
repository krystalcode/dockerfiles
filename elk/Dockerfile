FROM       nginx
MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

ADD        . /elk
WORKDIR    /elk

RUN        apt-get update && \
           apt-get install openjdk-7-jre-headless -y \
           apt-get install wget -y

RUN        cd /elk && \
           wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.tar.gz && \
           tar -zxf elasticsearch-1.3.4.tar.gz && \
           rm elasticsearch-1.3.4.tar.gz && \
           mv elasticsearch-1.3.4 elasticsearch && \
           elasticsearch/bin/elasticsearch

RUN        cd /elk && \
           wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
           tar -zxf logstash-1.4.2.tar.gz && \
           rm logstash-1.4.2.tar.gz && \
           mv logstash-1.4.2 logstash && \
           logstash/bin/logstash agent -f logstash.conf

RUN        cd /var/www && \
           wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.tar.gz && \
           tar -zxf kibana-3.1.1.tar.gz && \
           rm kibana-3.1.1.tar.gz && \
           mv kibana-3.1.1 kibana && \
