# HTTPAceProxy
==========================
### HTTPAceProxy&#174; https://github.com/pepsik-kiev/HTTPAceProxy



==========================
![stat46](https://user-images.githubusercontent.com/24189833/51075114-a10eab80-1687-11e9-84fd-5a748a71c804.png)

==========================

![ace-network](https://user-images.githubusercontent.com/24189833/53303271-bf5fed80-3868-11e9-89ca-d78438c1093b.png)

![1k11](https://user-images.githubusercontent.com/24189833/53304316-15865e00-3874-11e9-91b1-6f132b488b61.png)
==========================
![httpaproxy1](https://user-images.githubusercontent.com/24189833/52369131-44b56680-2a50-11e9-82f4-a1f3922a4457.png)
==========================
![1k12](https://user-images.githubusercontent.com/24189833/53304747-2eddd900-3879-11e9-916c-e38e9a42f81f.png)
### Установка: 
```
1. docker network create -d bridge --subnet=172.19.0.0/16 ace-network
2. docker run -d --net ace-network --ip="172.19.0.2" -p 8621:8621 -p 8027:8027 --name remotefork --restart=always coresystem/remotefork bash -c "./start.sh your_server_ip SZGHqCMt 1800"
3. docker run -d --net ace-network --ip="172.19.0.3" -p 8081:8081 --name httpaproxy --restart=always sybdata/ace86a37:httpaproxy
4. docker run -d --net ace-network --ip="172.19.0.4" --name aceremote --restart=always  coresystem/acestream bash -c "./start.sh SZGHqCMt 1800"
5. docker run -d --net ace-network --ip="172.19.0.5" -p 8101:8101 --name aceyproxy --restart=always sybdata/aceubase:acey 
```
### где:
* your_server_ip - Внешний IP-адрес сервера
* 1800 - Время очистки кеша acestream в секундах (30 минут)

### Настройка HTTPAceProxy
#### заходим в контейнер:
```
docker exec -it httpaproxy /bin/sh
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
* http://ip:8081/channels/?type=m3u
* http://ip:8081/channels/?group=3&type=m3u
#### список по группам (расшифровка групп: 1-детские; 2-музыка; 3-фильмы; 4-спорт; 5-общие; 6-познавательные; 7-новостные; 8-развлекательные; 9-взрослые; 10-мужские; 11-региональные; 12-религиозные)

## Дополнительно
Все каналы AceStream. Вытаскиваются при помощи acestream search:
* http://ip:8081/torrenttv
## +++
* http://ip:8081/allfon
* http://ip:8081/torrent-telik

#### Лог прокси
* tail -f -n 0 /tmp/acehttp.log

![918f1a](https://user-images.githubusercontent.com/24189833/41553984-b0c70dd0-7333-11e8-8091-1303fde6e2c3.png)

## Настройка RemoteFork 

![img_0645](https://user-images.githubusercontent.com/24189833/52170358-eedb7880-2748-11e9-817b-63ec339b98fb.jpg)

### Веб-интерфейс

* RemoteFork: http://your_server_ip:8027/
* Ace Stream: http://your_server_ip:6878/webui/app/SZGHqCMt/server
***
Движок запускается с дополнительным ключом --access-token "some_token" (по умолчанию "access token" генерируется случайным образом при каждом запуске движка). После этого веб-интерфейс будет доступен по ссылке: "http://your_server_ip:6878/webui/app/SZGHqCMt/server". После первоначальной настройки сводящейся в задании пароля, веб-интерфейс будет уже доступен по этой ссылке: "http://your_server_ip:6878/server" 

### Каналы Торрент-ТВ в формате M3U

http://server_ip:8027/ttv.html

![fork789](https://user-images.githubusercontent.com/24189833/52175940-f2541b80-27ab-11e9-8d6d-36388605bfee.png)

