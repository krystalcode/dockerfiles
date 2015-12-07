FROM krystalcode/fedora

# Install packages.
RUN dnf -y install java-1.8.0-openjdk-headless

# Clean up.
RUN dnf clean all

# Download and extract elasticsearch into /opt/elasticsearch.
RUN mkdir /opt/elasticsearch -p && \
    curl https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.0/elasticsearch-2.1.0.tar.gz | \
    tar -zxf - -C /opt/elasticsearch --strip-components=1

# Add installation bin folder to the $PATH environmental variable.
ENV PATH /opt/elasticsearch/bin:$PATH

# Install Marvel.
RUN /opt/elasticsearch/bin/plugin install license && \
    /opt/elasticsearch/bin/plugin install marvel-agent

# Expose ports.
EXPOSE 9200 9300

# Command.
CMD ["elasticsearch"]
