# AceStream + HTTPAceProxy
==========================
### ![logo-text-test](https://user-images.githubusercontent.com/24189833/36645710-3deca456-1a6d-11e8-8bf0-84f078703d8d.png) (v3.1.33.1)&#174; https://web.telegram.org/#/im?p=@AceStreamMOD + HTTPAceProxy&#174; https://github.com/pepsik-kiev/HTTPAceProxy

Ace Stream – это медиа-платформа с децентрализованной/распределенной системой поставки и хранения мультимедийных данных, предназначенная для создания интернет-сервисов с функциями AVoD (Аудио и Видео по Запросу) и Live Streaming («живого»/потокового вещания).

==========================
![stat46](https://user-images.githubusercontent.com/24189833/51075114-a10eab80-1687-11e9-84fd-5a748a71c804.png)

==========================
### Установка: 
```
docker run -d --net=host --privileged --name=ace86a --restart=always -e TZ=Europe/Berlin sybdata/ace86a37
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
