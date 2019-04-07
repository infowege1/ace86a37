# HTTPAceProxy + AceY - Ace Stream Proxy
==========================
### HTTPAceProxy&#174; https://github.com/pepsik-kiev/HTTPAceProxy
### AceY - Ace Stream Proxy&#174; https://github.com/xelaok/acey



==========================
![stat46](https://user-images.githubusercontent.com/24189833/51075114-a10eab80-1687-11e9-84fd-5a748a71c804.png)

![acenet](https://user-images.githubusercontent.com/24189833/55688897-6c587a80-597e-11e9-85f2-32b4a45872db.png)

==========================

![ace-netf2](https://user-images.githubusercontent.com/24189833/53686405-da2dd880-3d26-11e9-93fc-6ca0231e5f05.png)

![1k11](https://user-images.githubusercontent.com/24189833/53304316-15865e00-3874-11e9-91b1-6f132b488b61.png)

![1k17](https://user-images.githubusercontent.com/24189833/53686315-b5853100-3d25-11e9-98fa-b6297d8aab15.png)
==========================
![1k16](https://user-images.githubusercontent.com/24189833/53590107-58587680-3b91-11e9-86fd-502a2a264c2a.png)

### Установка: 
```
1. docker network create -d bridge --subnet=172.19.0.0/16 ace-network
2. docker run -d --net ace-network --ip="172.19.0.2" -p 8621:8621 -p 8027:8027 --name remotefork --restart=always coresystem/remotefork bash -c "./start.sh your_server_ip SZGHqCMt 1800"
3. docker run -d --net ace-network --ip="172.19.0.3" -p 8081:8081 --name httpaproxy --restart=always sybdata/ace86a37:httpaproxy
4. docker run -d --net ace-network --ip="172.19.0.4" -p 8624:8624 --name aceremote --restart=always  sybdata/aceubase:aceonly bash -c "/opt/start.sh SZGHqCMt 62064 6880 8624 1800"
5. docker run -d --net ace-network --ip="172.19.0.5" -p 8100:8100 --shm-size=3G --name aceyproxy --restart=always sybdata/ace86a37:acey 
```
### где:
* SZGHqCMt - access-token для доступа в Веб-Интерфейс
* your_server_ip - Внешний IP-адрес сервера
* 1800 - Время очистки кеша acestream в секундах (30 минут)
* 62064 - api-port
* 6880 - http-port
* 8624 - port

### Мониторинг 
#### Интерфейс мониторинга выдает такую информацию:
  * version - версия узла
  * max_connections - максимальное кол-во TCP-соединений
  * max_peers - максимальное кол-во одновременно подсоединенных узлов
  * max_upload_slots - максимальное кол-во открытых слотов для раздачи
  * download_speed - текущая скорость загрузки данных (байт/с)
  * upload_speed - текущая скорость отдачи данных (байт/с)
  * connected_peers_count - кол-во подсоединенных узлов
  * connected_peers - список подсоединенных узлов (пустой, если не задана опция --stats-report-peers)
  * upload_slots - текущее кол-во слотов для раздачи 
    
```
http://172.19.0.2:8621/app/monitor
http://172.19.0.4:8624/app/monitor

```

## Настройка HTTPAceProxy
### уже всё в коробке, ссылки на источник вбиты в соответствующие плагина
Все каналы AceStream. Вытаскиваются при помощи acestream search:
* p2pproxy_plugin не работает по причине недоступности Api
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

