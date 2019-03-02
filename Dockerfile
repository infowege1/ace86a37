FROM node:alpine
			
# install packages
RUN apk add --no-cache nano wget && \

# install proxy
wget -o - https://github.com/xelaok/acey/archive/master.zip -O aceproxy.zip && \
unzip aceproxy.zip -d /opt/ && \
rm -rf acestream_3.1.33.1_x86_wbUI.tar.gz && \
cd /opt/acey-master/ && \
npm i && \
npm run dist

# ports and volumes
EXPOSE 8100

# add services
ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["./start.sh"]
