FROM docker:19.03.15

MAINTAINER coolbeevip@gmail.com

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin \
    JAVA_ALPINE_VERSION=8.275.01-r0

RUN set -x && apk update \
  && apk add --no-cache bash git maven openjdk8="$JAVA_ALPINE_VERSION" \
  && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
  && apk add glibc-2.29-r0.apk \
  && rm -rf /var/cache/apk/* \
  && rm /etc/apk/keys/sgerrand.rsa.pub
