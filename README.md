# AceStream + HTTPAceProxy
==========================
### ![logo-text-test](https://user-images.githubusercontent.com/24189833/36645710-3deca456-1a6d-11e8-8bf0-84f078703d8d.png) (v3.1.37)&#174; https://web.telegram.org/#/im?p=@AceStreamMOD + HTTPAceProxy&#174; https://github.com/pepsik-kiev/HTTPAceProxy

Ace Stream – это медиа-платформа с децентрализованной/распределенной системой поставки и хранения мультимедийных данных, предназначенная для создания интернет-сервисов с функциями AVoD (Аудио и Видео по Запросу) и Live Streaming («живого»/потокового вещания).

==========================
![stat46](https://user-images.githubusercontent.com/24189833/51075114-a10eab80-1687-11e9-84fd-5a748a71c804.png)

==========================
### Установка: 
```
docker run -d --net=host --privileged --name=ace86a --restart=always sybdata/ace86a37:master
```

#### Лог движка 
* tail -f -n 0 /opt/acestream.engine/acestream.log

#### Лог прокси
* tail -f -n 0 /tmp/acehttp.log

![918f1a](https://user-images.githubusercontent.com/24189833/41553984-b0c70dd0-7333-11e8-8091-1303fde6e2c3.png)
