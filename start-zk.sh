#!/bin/bash
#set -e

if [[ -z $ZOOKEEPER_TICKTIME ]]; then
    export ZOOKEEPER_TICKTIME=2000
fi

if [[ -z $ZOOKEEPER_INITLIMIT ]]; then
    export ZOOKEEPER_INITLIMIT=10
fi

if [[ -z $ZOOKEEPER_SYNCLIMIT ]]; then
    export ZOOKEEPER_SYNCLIMIT=5
fi

if [[ -z $ZOOKEEPER_CLIENTPORT ]]; then
    export ZOOKEEPER_CLIENTPORT=2181
fi

sed -e "s/{{ticktime}}/${ZOOKEEPER_TICKTIME}/g" \
    -e "s/{{initLimit}}/${ZOOKEEPER_INITLIMIT}/g" \
    -e "s/{{syncLimit}}/${ZOOKEEPER_SYNCLIMIT}/g" \
    -e "s/{{clientPort}}/${ZOOKEEPER_CLIENTPORT}/g" \
    /opt/zookeeper/conf/zoo.cfg.tpl > /opt/zookeeper/conf/zoo.cfg

/opt/zookeeper/bin/zkServer.sh start-foreground
