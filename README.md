# HTTPAceProxy
==========================
### HTTPAceProxy&#174; https://github.com/pepsik-kiev/HTTPAceProxy



==========================
![stat46](https://user-images.githubusercontent.com/24189833/51075114-a10eab80-1687-11e9-84fd-5a748a71c804.png)

==========================

![httpaproxy](https://user-images.githubusercontent.com/24189833/52363944-3f521f00-2a44-11e9-8ae3-0b9a479b4683.png)


### Установка: 
```
1. docker network create -d bridge --subnet=172.22.0.0/16 ace-network
2. docker run -d --net ace-network -p 6878:6878 -p 8621:8621 -p 8027:8027 --name remotefork --restart=always coresystem/remotefork bash -c "./start.sh your_server_ip SZGHqCMt 1800"
3. docker run -d --net ace-network -p 8081:8081 --name=httpaproxy --restart=always sybdata/ace86a37:httpaprpxy
```
 #### где:
  * TZ='timezone'

### Настройка HTTPAceProxy
#### заходим в контейнер:
```
docker exec -it <имя контейнера> /bin/sh
```
#### редактируем следующее:
```
nano /opt/tv/HTTPAceProxy-master/plugins/config/p2pproxy.py
```
строчки 17 и 19
```
#Insert your email on torrent-tv.ru here
email = 're.place@me'
#Insert your torrent-tv account password
password ='ReplaceMe'
```
### Полная совместимость и поддержка офф. виджета ттв
### Для получения плейлиста, используйте ссылки вида:
* http://ip:8000/channels/?type=m3u
* http://ip:8000/channels/?group=3&type=m3u
#### список по группам (расшифровка групп: 1-детские; 2-музыка; 3-фильмы; 4-спорт; 5-общие; 6-познавательные; 7-новостные; 8-развлекательные; 9-взрослые; 10-мужские; 11-региональные; 12-религиозные)

#### Лог движка 
* tail -f -n 0 /opt/acestream.engine/acestream.log

#### Лог прокси
* tail -f -n 0 /tmp/acehttp.log

![918f1a](https://user-images.githubusercontent.com/24189833/41553984-b0c70dd0-7333-11e8-8091-1303fde6e2c3.png)
