FROM openjdk:8-jdk-alpine3.9

MAINTAINER luoxiaojun1992 <luoxiaojun1992@sina.cn>

ENV INSTALL_VERSION 21.0

RUN apk add git
RUN apk add nodejs
RUN apk add npm

WORKDIR /usr/src/myapp

RUN git clone https://github.com/yanagishima/yanagishima.git \
  && cd yanagishima \
  && git checkout -b ${INSTALL_VERSION} refs/tags/${INSTALL_VERSION} \
  && ./gradlew distZip \
  && cd build/distributions \
  && unzip yanagishima-${INSTALL_VERSION}.zip

WORKDIR /usr/src/myapp/yanagishima-${INSTALL_VERSION}

EXPOSE 8080

CMD ["/usr/src/myapp/yanagishima/build/distributions/yanagishima-${INSTALL_VERSION}/bin/yanagishima-start.sh"]
