FROM php:7.1-fpm
LABEL author="kasiss"
LABEL email="xueyezhishang@163.com"

RUN docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) tokenizer \
    && docker-php-ext-install -j$(nproc) pdo \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) sockets \
    && docker-php-ext-install -j$(nproc) pdo_mysql 

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxml2 \
    && docker-php-ext-install -j$(nproc) soap 

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
    


ENV PHP_EXT_SWOOLE=swoole-1.9.9
RUN apt-get update && apt-get install -y \
        libssl-dev \
    && docker-php-source extract \
    && ( \
    	cd /usr/src/php/ext/openssl \
    	&& cp config0.m4 config.m4 \
    	&& docker-php-ext-configure openssl \
    	&& docker-php-ext-install -j$(nproc) openssl) \    
    && docker-php-source delete \
    && cd /tmp \
    && pecl download $PHP_EXT_SWOOLE \
    && mkdir -p /tmp/$PHP_EXT_SWOOLE \
    && tar -xf ${PHP_EXT_SWOOLE}.tgz -C /tmp/$PHP_EXT_SWOOLE --strip-components=1 \
    && docker-php-ext-configure /tmp/$PHP_EXT_SWOOLE  --enable-openssl \
    && docker-php-ext-install /tmp/$PHP_EXT_SWOOLE \
    && rm -rf /tmp/${PHP_EXT_SWOOLE}*


