#基于php7.1-fpm镜像
FROM php:7.0-fpm
#作者
MAINTAINER kasiss "xueyezhishang@163.com"

CMD ["bash"]
#安装基础扩展
RUN docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) tokenizer \
    && docker-php-ext-install -j$(nproc) pdo \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) sockets \
    && docker-php-ext-install -j$(nproc) pdo_mysql 
#安装soap扩展
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxml2 \
    && docker-php-ext-install -j$(nproc) soap 
#安装gd intl gettext exif mycrypt扩展
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) gettext \
    && docker-php-ext-install -j$(nproc) exif 
    
#安装openssl扩展
RUN apt-get update && apt-get install -y \
        libssl-dev \
    && docker-php-source extract \
    && ( \
    	cd /usr/src/php/ext/openssl \
    	&& cp config0.m4 config.m4 \
    	&& docker-php-ext-configure openssl \
    	&& docker-php-ext-install -j$(nproc) openssl) \    
    && docker-php-source delete 
#定义swoole和yaf版本号常量
ENV PHP_EXT_SWOOLE=swoole-1.9.21 PHP_EXT_YAF=yaf-3.0.5 PHP_EXT_REDIS=redis-3.1.6
#下载安装swoole yaf redis
RUN cd /tmp \
    && pecl download $PHP_EXT_SWOOLE \
    && mkdir -p /tmp/$PHP_EXT_SWOOLE \
    && tar -xf ${PHP_EXT_SWOOLE}.tgz -C /tmp/$PHP_EXT_SWOOLE --strip-components=1 \
    && docker-php-ext-configure /tmp/$PHP_EXT_SWOOLE  --enable-openssl \
    && docker-php-ext-install /tmp/$PHP_EXT_SWOOLE \
    && rm -rf /tmp/${PHP_EXT_SWOOLE}* \
    && pecl download  $PHP_EXT_YAF \
    && mkdir -p /tmp/$PHP_EXT_YAF \
    && tar -xf ${PHP_EXT_YAF}.tgz -C /tmp/$PHP_EXT_YAF --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_YAF \
    && rm -rf /tmp/${PHP_EXT_YAF}* \
    && pecl download $PHP_EXT_REDIS \
    && mkdir -p /tmp/$PHP_EXT_REDIS \
    && tar -xf ${PHP_EXT_REDIS}.tgz -C /tmp/$PHP_EXT_REDIS --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_REDIS \
    && rm -rf /tmp/$PHP_EXT_REDIS \
    && docker-php-source delete

#安装nginx
RUN apt-get update && apt-get install -y nginx
ADD localhost.conf /etc/nginx/conf.d/localhost.conf
ADD run.sh /run.sh
#载入命令
RUN chmod -R 755 /run.sh
CMD /run.sh
