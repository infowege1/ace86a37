FROM sybdata/py37x
			
# install packages 
RUN \
 mkdir -p opt/tv && \
 mkdir -p /mnt/films && \
 
# install aceproxy
 wget -O - https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip -O aceproxy.zip && \
 unzip aceproxy.zip -d /opt/tv && \

# cleanup
 rm -rf aceproxy.zip

# add local files
COPY root/ /
RUN chmod +x /opt/start.sh


# ports and volumes
EXPOSE 8081

CMD ["/opt/start.sh"]
