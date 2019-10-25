FROM openjdk:14-jdk-alpine3.10

MAINTAINER luoxiaojun1992 <luoxiaojun1992@sina.cn>

ENV INSTALL_VERSION=21.0

RUN apk add nodejs
RUN apk add npm

WORKDIR /usr/src/myapp

RUN git clone https://github.com/yanagishima/yanagishima.git
RUN cd yanagishima
RUN git checkout -b ${INSTALL_VERSION} refs/tags/${INSTALL_VERSION}
RUN ./gradlew distZip
RUN cd build/distributions
RUN unzip yanagishima-${INSTALL_VERSION}.zip

WORKDIR /usr/src/myapp/yanagishima-${INSTALL_VERSION}

EXPOSE 8080

CMD ["/usr/src/myapp/yanagishima-${INSTALL_VERSION}/bin/yanagishima-start.sh"]
