FROM openjdk:8
# FROM harisekhon/ubuntu-java

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
# RUN apt-get install apt-transport-https && apt-get install -y wget && apt-get install -y gnupg && apt-get install -y gnupg1 && apt-get install -y gnupg2
RUN apt-get install apt-transport-https
RUN sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
RUN sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
RUN apt-get update && apt-get install -y python3 && apt-get install -y dart=2.7.2-1

RUN java -version
RUN python3 --version
RUN dart --version

ENV PATH="$PATH:/usr/lib/dart/bin"
RUN pub global activate webdev
RUN pub --version

