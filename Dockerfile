# Hadoop 0.0 demo
#

FROM centos:7
MAINTAINER Owen O'Malley <owen@hortonworks.com>

RUN yum check-update || true
RUN yum install -y \
  java-1.7.0-openjdk-devel \
  less \
  openssh-client \
  openssh-server \
  sudo \
  unzip

# PASSWORD from `openssl passwd -1 hadoop`
RUN adduser hadoop -p '$1$0ztRGExh$2cwm7kUUvHHDYUg8LXPci/' -G wheel
RUN ssh-keygen -A

WORKDIR /home/hadoop
USER hadoop

COPY bash_profile .bash_profile
COPY alice.txt \
  nutch-0.8-dev.tar.gz \
  README.txt \
  start-all.sh \
  wordcount.jar \
  wordcount.xml \
  ./

RUN tar xzf nutch-0.8-dev.tar.gz && rm nutch-0.8-dev.tar.gz
COPY nutch-site.xml nutch-0.8-dev/conf/nutch-site.xml

USER root
EXPOSE 22 50030
CMD ["/usr/sbin/sshd", "-D"]
