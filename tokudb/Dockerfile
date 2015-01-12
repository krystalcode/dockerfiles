FROM krystalcode/baseimages_phusion_baseimage

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install.
RUN apt-get -y install libaio1

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./mysql-5.5.40-tokudb-7.5.3-linux-x86_64.tar.gz /data

ADD ./my.cnf /etc/my.cnf

RUN groupadd -g 927 mysql && \
    useradd -r -u 927 -g mysql mysql && \
    mkdir -pv /opt/tokutek && \
    cd /opt/tokutek && \
    mv /data/mysql-5.5.40-tokudb-7.5.3-linux-x86_64 /opt/tokutek/ && \
    ln -sv mysql-5.5.40-tokudb-7.5.3-linux-x86_64 mysql && \
    cd mysql && \
    chown -R mysql:mysql . && \
    scripts/mysql_install_db --user=mysql && \
    sed -i 's|basedir=$|basedir=/opt/tokutek/mysql|g' support-files/mysql.server && \
    sed -i 's|datadir=$|datadir=/var/lib/mysql|g' support-files/mysql.server && \
    ln -sv /opt/tokutek/mysql/support-files/mysql.server /etc/init.d/mysql

ENV PATH $PATH:/opt/tokutek/mysql/bin

CMD service mysql start
