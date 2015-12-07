FROM krystalcode/fedora

# Install packages.
RUN dnf -y install emacs w3m git patch wget php-cli

# Install packages required for the install the ruby gems.
RUN dnf -y install ruby ruby-devel gcc make redhat-rpm-config

# Clean up.
RUN dnf clean all

# Install "composer".
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Install "compass".
RUN gem install compass bootstrap-sass

# Add "emacs" configuration file.
ADD ./.emacs /root/

# Add git configuration file.
ADD ./.gitconfig /root/

# Add global .gitignore file.
ADD ./.gitignore /root/

# Add "ssh" configuration file.
ADD ./.sshconfig /root/.ssh/config
RUN chmod 644 ~/.ssh/config
