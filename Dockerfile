FROM sybdata/nginx-mainline
COPY license.txt /etc/astra/license.txt
COPY astra.conf /astra.conf
RUN wget -O /bin/astra http://cesbo.com/download/astra/$(uname -m)
RUN chmod +x /bin/astra
RUN mkdir ramcache
RUN mount -t tmpfs tmpfs /ramcache
CMD cp /astra.conf /run && /bin/astra --stream -p 4000 -c /run/astra.conf 

