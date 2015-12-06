FROM krystalcode/fedora

# Install "tar", required by "nvm" for installing nodejs.
RUN dnf -y install tar

# Clean up.
RUN dnf clean all

# Install "nvm".
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
