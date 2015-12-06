FROM krystalcode/fedora

# Download and extract kibana into /opt/kibana.
RUN mkdir /opt/kibana -p && \
    curl -O https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz | \
    tar -zxf - -C /opt/kibana --strip-components=1

# Add installation bin folder to the $PATH environmental variable.
ENV PATH /opt/kibana/bin:$PATH

# Install Marvel.
RUN /opt/kibana/bin/kibana --install elasticsearch/marvel/latest

# Expose ports.
EXPOSE 5601

# Command.
CMD ["kibana"]
