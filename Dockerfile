FROM maven:3.6.3-jdk-8

MAINTAINER coolbeevip@gmail.com

RUN apt-get update && apt-get install -y git docker-ce-cli
