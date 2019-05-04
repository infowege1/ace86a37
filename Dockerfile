FROM alpine
COPY license.txt /etc/astra/license.txt
COPY astra.conf /astra.conf
RUN wget -O /bin/astra http://cesbo.com/download/astra/$(uname -m)
RUN chmod +x /bin/astra
#CMD cp /astra.conf /run && /bin/astra --stream -p 4000 -c /run/astra.conf 
CMD /bin/astra -c /etc/astra/stream2 -p 4000 --log /var/log/astra.log --pid /var/run/astra.pid --daemon
