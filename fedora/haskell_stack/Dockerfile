FROM krystalcode/fedora

# Add the fpcomplete repository.
RUN curl -sSL https://s3.amazonaws.com/download.fpcomplete.com/fedora/23/fpco.repo | tee /etc/yum.repos.d/fpco.repo

# Install stack.
RUN dnf -y install stack
