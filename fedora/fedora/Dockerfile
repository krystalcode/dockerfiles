FROM fedora

# Upgrade packages.
RUN dnf -y upgrade

# Install "powerline". "which" is required by the powerline configuration added
# below.
# @Issue("Rewrite .bashrc addition so that 'which' is not required")
RUN dnf -y install powerline which

# Clean up.
RUN dnf -y clean all

# Configure bash shell to use powerline by default.
RUN printf '\n%s\n%s\n  %s\n  %s\n  %s\n  %s\n%s\n\n' '# Use powerline' 'if [ -f `which powerline-daemon` ]; then' 'powerline-daemon -q' 'POWERLINE_BASH_CONTINUATION=1' 'POWERLINE_BASH_SELECT=1' '. /usr/share/powerline/bash/powerline.sh' 'fi'  >> ~/.bashrc
