FROM daocloud.io/centos:7

MAINTAINER 326236882@qq.com

EXPOSE 3000

EXPOSE 3001

ADD resource/bin /broadcastserver/bin

ADD resource/node-v8.11.3-linux-x64.tar.gz /broadcastserver/
ENV NODE_HOME=/broadcastserver/node-v8.11.3-linux-x64
ENV NODE_PATH=$NODE_HOME/lib
ENV PATH=$NODE_HOME/bin:$PATH

ADD resource/broadCastNodeJS /broadcastserver/broadCastNodeJS
RUN cd /broadcastserver/broadCastNodeJS && npm install -g
CMD /broadcastserver/bin/broadcast.sh
