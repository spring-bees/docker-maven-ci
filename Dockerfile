FROM docker:19.03.15-dind

MAINTAINER coolbeevip@gmail.com

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin \
    JAVA_ALPINE_VERSION=8.272.10-r4

RUN set -x && \
    apk update && \
	apk add openjdk8="$JAVA_ALPINE_VERSION"
