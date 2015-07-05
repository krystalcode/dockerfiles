FROM fedora

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN dnf -y update

# Install haskell-platform.
RUN dnf -y install haskell-platform

# Clean up.
RUN dnf clean all
