FROM        nginx

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

RUN        apt-get update && \
           apt-get install openjdk-7-jre-headless -y && \
           apt-get install wget -y && \
           apt-get install ca-certificates -y

RUN        mkdir /elk

RUN        cd /elk && \
           wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.tar.gz && \
           tar -zxf elasticsearch-1.3.4.tar.gz && \
           rm elasticsearch-1.3.4.tar.gz && \
           mv elasticsearch-1.3.4 elasticsearch

RUN        cd /elk && \
           wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
           tar -zxf logstash-1.4.2.tar.gz && \
           rm logstash-1.4.2.tar.gz && \
           mv logstash-1.4.2 logstash

RUN        cd /var && \
           wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.tar.gz && \
           tar -zxf kibana-3.1.1.tar.gz && \
           rm kibana-3.1.1.tar.gz && \
           mv kibana-3.1.1 www

CMD        /elk/elasticsearch/bin/elasticsearch

# logstash to be executed from the build directory Dockerfile so that the logstash.conf is loaded.
