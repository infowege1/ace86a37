FROM sybdata/py37x
			
# install packages 
RUN \
apk add --no-cache nodejs npm && \
mkdir -p opt/tv && \
mkdir -p /mnt/films && \
 
# install aceproxy
wget -O - https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip -O aceproxy.zip && \
unzip aceproxy.zip -d /opt/tv && \
 
# install aceyproxy
wget -O - https://github.com/xelaok/acey/archive/master.zip -O aceyproxy.zip && \
unzip aceproxy.zip -d /opt/ && \
cd /opt/acey-master/ && \
npm i && \
npm run dist && \

# cleanup
rm -rf aceproxy.zip aceyproxy.zip

# add local files
COPY root/ /
RUN chmod +x /opt/start.sh


# ports and volumes
EXPOSE 8081 8100

CMD ["/opt/start.sh"]
