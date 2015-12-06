FROM krystalcode/fedora_nvm

# Install "git", required by "npm" for installing some dependencies.
RUN dnf -y install git

# Clean up.
RUN dnf clean all

ENV NODE_VERSION 5.1.0

RUN . $HOME/.nvm/nvm.sh && \
    nvm install $NODE_VERSION
