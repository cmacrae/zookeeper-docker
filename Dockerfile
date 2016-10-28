FROM openjdk:8-jre-alpine
MAINTAINER Calum MacRae <calum0macrae@gmail.com>

ARG MIRROR=http://apache.mirrors.pair.com
ARG VERSION=3.4.9

LABEL name="zookeeper" version=$VERSION

RUN apk add --no-cache wget bash \
&& mkdir /opt \
&& wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
&& mv /opt/zookeeper-$VERSION /opt/zookeeper \
&& mkdir -p zookeeper

ADD start-zk.sh /usr/bin/start-zk.sh
ADD zoo.cfg.tpl /opt/zookeeper/conf/zoo.cfg.tpl

EXPOSE 2181

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

CMD ["start-zk.sh"]
