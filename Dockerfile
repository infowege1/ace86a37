FROM alpine:3.7

WORKDIR /tmp

RUN apk add --no-cache nano mc wget tzdata && \

# install acestream-engine
   mkdir -p /opt/acestream/ && \
   wget -o - https://sybdata.de/files/public-docs/acestream_3.1.31_webUI_x86.tar.gz && \
   tar -zxvf acestream_3.1.31_webUI_x86.tar.gz && \
   mv androidfs /opt/acestream/androidfs && \
   find /opt/acestream/androidfs/system -type d -exec chmod 755 {} \; && \
   find /opt/acestream/androidfs/system -type f -exec chmod 644 {} \; && \
   chmod 755 /opt/acestream/androidfs/system/bin/* /opt/acestream/androidfs/acestream.engine/python/bin/python && \
   rm -rf /tmp/* 
 # add services
ADD acestream.start /opt/acestream/acestream.start
ADD acestream.stop /opt/acestream/acestream.stop
ADD acestream.conf /opt/acestream/androidfs/acestream.engine/acestream.conf
ADD start.sh /start.sh
RUN chmod +x /start.sh
RUN chmod +x /opt/acestream/acestream.start
RUN chmod +x /opt/acestream/acestream.stop

EXPOSE 8621 62062 6878

WORKDIR /  
