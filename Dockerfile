FROM sybdata/py37x
			
# install packages 
RUN \
 mkdir -p opt/tv && \
 mkdir -p /mnt/films && \
 
# install aceproxy
 wget -O - https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip -O aceproxy.zip && \
 unzip aceproxy.zip -d /opt/tv && \
 #acestream
 wget https://f002.backblazeb2.com/file/acestream/acestream_3.1.37_x86_webUI.tar.gz && \
 tar -zxvf acestream_3.1.37_x86_webUI.tar.gz && \
 mv acestream.engine/ /opt/ && \

# cleanup
 rm -rf acestream_3.1.37_x86_webUI.tar.gz aceproxy.zip

# add local files
COPY root/ /
RUN chmod +x /opt/acestream.engine/start.sh


# ports and volumes
EXPOSE 8082 6876 8626 

CMD ["/opt/acestream.engine/start.sh"]
