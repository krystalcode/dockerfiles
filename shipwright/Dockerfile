# DOCKER-VERSION 1.2.0

FROM    krystalcode/python-pip

# Install Docker
RUN     apt-get install docker.io
RUN     ln -sf /usr/bin/docker.io /usr/local/bin/docker
RUN sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

# Install shipwright from GitHub to get the master.
# "pip install shipwright" would return 0.0.2 which has problems.
# To replace with "pip install shipwright" when latest stable version is working well.
RUN     apt-get install git -y
RUN     pip install git+https://github.com/6si/shipwright.git
