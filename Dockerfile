FROM centos:centos7

MAINTAINER coolbeevip@gmail.com

ARG MAVEN_VERSION=3.6.3

USER root

# java
RUN yum update -y && \
    yum install -y which java-1.8.0-openjdk java-1.8.0-openjdk-devel

ENV JAVA_HOME /usr/lib/jvm/java

# maven
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_VERSION=${MAVEN_VERSION}
ENV M2_HOME /usr/share/maven
ENV maven.home $M2_HOME
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH

# git
RUN yum -y install git

# docker

RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum-config-manager --disable docker-ce-nightly
RUN yum list docker-ce --showduplicates
RUN yum install -y docker-ce-cli containerd.io

# clean
RUN yum clean all

USER 10001

CMD ["mvn","-version"]
