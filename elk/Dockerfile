FROM ubuntu

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install java.
RUN apt-get -y install openjdk-7-jre-headless

# Install wget, needed to downloaded elk files.
RUN apt-get -y install wget

# Install supervisor.
RUN apt-get -y install supervisor

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and extract elasticsearch into /opt/elasticsearch.
RUN mkdir /opt/elasticsearch -p && \
    wget -qO- https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz | \
    tar -zxf - -C /opt/elasticsearch --strip-components=1

# Download and extract logstash into /opt/logstash.
RUN mkdir /opt/logstash && \
    wget -qO- http://download.elastic.co/logstash/logstash/logstash-1.5.0.tar.gz | \
    tar -zxf - -C /opt/logstash --strip-components=1

# Add logstash configuration.
ADD ./logstash.conf /opt/logstash/logstash.conf

# Download and extract kibana into /opt/logstash.
RUN mkdir /opt/kibana && \
    wget -qO- https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz | \
    tar -zxf - -C /opt/kibana --strip-components=1

# Add supervisord configuration.
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 9200
EXPOSE 5601

# Start supervisor which will make sure that elasticsearch, logstash and kibana are running.
CMD ["/usr/bin/supervisord"]
