FROM docker:19.03.15-dind

MAINTAINER coolbeevip@gmail.com

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin \
    JAVA_ALPINE_VERSION=8.272.10-r4

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk \
    && apk add glibc-2.32-r0.apk && rm glibc-2.32-r0.apk
        
RUN set -x && \
    apk update && \
	apk add openjdk8="$JAVA_ALPINE_VERSION" git maven
