FROM centos:centos7

MAINTAINER coolbeevip@gmail.com

ARG MAVEN_VERSION=3.6.3
ENV MAVEN_URL http://ftp.halifax.rwth-aachen.de
ENV MAVEN_PKG ${MAVEN_URL}/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV MAVEN_HOME /opt/apache-maven-${MAVEN_VERSION}
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${MAVEN_HOME}/bin

RUN yum install -y \
       java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8 \
       java-1.8.0-openjdk-devel-1.8.0.262.b10-0.el7_8 \
       git \
    && echo "securerandom.source=file:/dev/urandom" >> /usr/lib/jvm/jre/lib/security/java.security \
    && yum clean all

ENV JAVA_HOME /etc/alternatives/jre

RUN curl ${MAVEN_PKG} | tar xz
