# 基于php:7.1-fpm 增加php扩展 

### 构建
docker build -t php-fpm:7.1 .

### 配置目录

php配置目录     /usr/local/etc/php \
php扩展配置目录  /usr/local/etc/php/conf.d \
php-fpm配置文件 /usr/local/etc/php-fpm.conf \
php-fpm配置扩展 /usr/local/etc/php-fpm.d 

### 启动命令

docker  run -d --name myproject-php   -v [项目本地目录]:[容器内部目录] php-fpm:7.1
