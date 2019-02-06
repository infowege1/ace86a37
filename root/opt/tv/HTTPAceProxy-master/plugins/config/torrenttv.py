# -*- coding: utf-8 -*-
'''
Torrent-tv.ru Playlist Downloader Plugin configuration file
'''
# Proxy settings.
# For example you can install tor browser and add in torrc SOCKSPort 9050
# proxies = {'http' : 'socks5h://127.0.0.1:9050','https' : 'socks5h://127.0.0.1:9050'}
# If your http-proxy need authentification - proxies = {'https' : 'https://user:password@ip:port'}

#proxies = {'http' : 'socks5h://192.168.1.1:9100', 'https' : 'socks5h://192.168.1.1:9100'}
proxies = None

# Insert your Torrent-tv.ru playlist URL here
url = 'http://[2001:470:6e:c26:1:1:2:2]/trash/ttv-list/as.all.player.m3u'

# Download playlist every N minutes to keep it fresh
# 0 = disabled
updateevery = 360

# TV Guide URL
tvgurl = 'http://epg.do.am/tv.gz'

# Shift the TV Guide time to the specified number of hours
tvgshift = 0

# Channel playlist template
# The following values are allowed:
# name - channel name
# url - channel URL
# tvg - channel tvg-name (optional)
# tvgid - channel tvg-id (optional)
# group - channel playlist group-title (optional)
# logo - channel picon file tvg-logo (optional)
m3uheadertemplate = '#EXTM3U url-tvg="%s" tvg-shift=%d deinterlace=1 m3uautoload=1 cache=1000\n' % (tvgurl, tvgshift)
m3uchanneltemplate = '#EXTINF:-1 group-title="%(group)s" tvg-name="%(tvg)s" tvg-logo="%(logo)s",%(name)s\n#EXTGRP:%(group)s\n%(url)s\n'
