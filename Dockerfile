FROM mcr.microsoft.com/java/jdk:11u5-zulu-alpine

MAINTAINER luoxiaojun1992 <luoxiaojun1992@sina.cn>

RUN apk add git
RUN apk add nodejs
RUN apk add npm
RUN apk add bash

RUN mkdir -p /usr/src/myapp

WORKDIR /usr/src/myapp

COPY ./*.zip .

RUN unzip yanagishima-21.0.zip

WORKDIR /usr/src/myapp/yanagishima-21.0

EXPOSE 8080

ENTRYPOINT ["bash", "/usr/src/myapp/yanagishima-21.0/bin/yanagishima-run.sh"]
