FROM sybdata/nginx-mainline
			
# install packages
RUN apk add --no-cache nano wget && \
	
# acestream
mkdir -p /opt/acestream.engine/ && \
wget -o - https://sybdata.de/data/acestream/acestream_3.1.33.1_x86_wbUI.tar.gz && \
tar -zxvf acestream_3.1.33.1_x86_wbUI.tar.gz && \
mv acestream.engine/ /opt/ && \

# install proxy
wget -o - https://github.com/xelaok/acey/archive/master.zip -O aceproxy.zip && \
unzip aceproxy.zip -d /opt/ && \
rm -rf acestream_3.1.33.1_x86_wbUI.tar.gz && \
cd /opt/acey-master/ && \
npm i && \
npm run dist

# add local files
COPY root/ /
RUN chmod +x /opt/acestream.engine/start.sh
RUN chmod +x /opt/pin.sh
RUN chmod +x pin.sh
RUN /opt/pin.sh

# ports and volumes
EXPOSE 8101 8621 62062

CMD ["/opt/acestream.engine/start.sh"]
