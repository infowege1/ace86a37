FROM alpine
			
# install packages
RUN apk add --no-cache nano wget && \

# install proxy
wget -o - https://github.com/xelaok/acey/archive/master.zip -O aceproxy.zip && \
unzip aceproxy.zip -d /opt/ && \
rm -rf aceproxy.zip && \
cd /opt/acey-master/ && \
npm install -g npm && \
npm i && \
npm run dist

# ports and volumes
EXPOSE 8100 4000

# add services
ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

CMD ["/opt/start.sh"]
