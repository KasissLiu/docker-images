# 基于php:7.0-fpm 增加php扩展 并安装nginx

### 构建
docker build -t nginx-php-fpm:latest .

### dockerHub下载
docker pull kasiss/nginx-php

### dockerHub 地址
<a href="https://hub.docker.com/r/kasiss/nginx-php/">kasiss/nginx-php</a>


### 配置目录

nginx站点目录   /usr/share/nginx/html \
nginx配置目录   /etc/nginx \
nginx扩展配置目录 /etc/nginx/conf.d \

php配置目录     /usr/local/etc/php \
php扩展配置目录  /usr/local/etc/php/conf.d \
php-fpm配置文件 /usr/local/etc/php-fpm.conf \
php-fpm配置扩展 /usr/local/etc/php-fpm.d 

### 启动命令

docker  run -d --name myproject -p [local port]:80 -v[local path]:/var/www/html [-v [nginx config path]:/etc/nginx/conf.d] kasiss/nginx-php

