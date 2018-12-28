#基于php7.2-fpm镜像
FROM php:7.2-fpm
#作者
LABEL author="kasiss"
LABEL email="xueyezhishang@163.com"

#安装基础扩展
RUN docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) tokenizer \
    && docker-php-ext-install -j$(nproc) pdo \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) sockets \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
 #   && docker-php-ext-install -j$(nproc) pdo_pgsql \
 #   && docker-php-ext-install -j$(nproc) pgsql \
    && docker-php-ext-install -j$(nproc) calendar \
    && docker-php-ext-install -j$(nproc) sysvsem \
    && docker-php-ext-install -j$(nproc) sysvmsg \
    && docker-php-ext-install -j$(nproc) sysvshm  

         
#安装gd intl gettext exif mycrypt soap扩展
RUN apt-get update && apt-get install -y \
        libsodium \
        libc-client-dev \
        libxml2-dev \
        libxml2 \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
    && docker-php-ext-install -j$(nproc) sodium \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-install -j$(nproc) imap-ssl \
    && docker-php-ext-install -j$(nproc) soap \
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
ENV PHP_EXT_SWOOLE=swoole-2.1.0 PHP_EXT_YAF=yaf-3.0.5 PHP_EXT_REDIS=redis-3.1.6 PHP_EXT_MONGO=mongodb-1.4.1 PHP_EXT_IGBINARY=igninary-2.0.7 PHP_EXT_MSGPACK=msgpack-2.0.2 PHP_EX_MEMCACHED=memcached-3.1.0 
#下载安装swoole yaf redis mongo 扩展
RUN cd /tmp \
#    && pecl download $PHP_EXT_SWOOLE \
    && curl -O http://pecl.php.net/get/${PHP_EXT_SWOOLE}.tgz \
    && mkdir -p /tmp/$PHP_EXT_SWOOLE \
    && tar -xf ${PHP_EXT_SWOOLE}.tgz -C /tmp/$PHP_EXT_SWOOLE --strip-components=1 \
    && docker-php-ext-configure /tmp/$PHP_EXT_SWOOLE  --enable-openssl \
    && docker-php-ext-install /tmp/$PHP_EXT_SWOOLE \
    && rm -rf /tmp/${PHP_EXT_SWOOLE}* \
#    && pecl download  $PHP_EXT_YAF \
    && curl -O http://pecl.php.net/get/${PHP_EXT_YAF}.tgz \
    && mkdir -p /tmp/$PHP_EXT_YAF \
    && tar -xf ${PHP_EXT_YAF}.tgz -C /tmp/$PHP_EXT_YAF --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_YAF \
    && rm -rf /tmp/${PHP_EXT_YAF}* \
#    && pecl download $PHP_EXT_REDIS \
    && curl -O http://pecl.php.net/get/${PHP_EXT_REDIS}.tgz \
    && mkdir -p /tmp/$PHP_EXT_REDIS \
    && tar -xf ${PHP_EXT_REDIS}.tgz -C /tmp/$PHP_EXT_REDIS --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_REDIS \
    && rm -rf /tmp/${PHP_EXT_REDIS}* \
#    && pecl download $PHP_EXT_MONGO \
    && curl -O http://pecl.php.net/get/${PHP_EXT_MONGO}.tgz \
    && mkdir -p /tmp/$PHP_EXT_MONGO \
    && tar -xf ${PHP_EXT_MONGO}.tgz -C /tmp/$PHP_EXT_MONGO --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_MONGO \
    && rm -rf /tmp/${PHP_EXT_MONGO}* \
#    && pcel download $PHP_EXT_IGBINARY
    && curl -O http://pecl.php.net/get/${PHP_EXT_IGBINARY}.tgz \
    && mkdir -p /tmp/$PHP_EXT_IGBINARY \
    && tar -xf ${PHP_EXT_IGBINARY}.tgz -C /tmp/$PHP_EXT_IGBINARY --strip-componets=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_IGBINARY \
    && rm -rf /tmp/${PHP_EXT_IGBINARY} \
#    && pcel download $PHP_EXT_MSGPACK
    && curl -O http://pecl.php.net/get/${PHP_EXT_MSGPACK}.tgz \
    && mkdir -p /tmp/$PHP_EXT_MSGPACK \
    && tar -xf ${PHP_EXT_MSGPACK}.tgz -C /tmp/$PHP_EXT_MSGPACK --strip-componets=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_MSGPACK \
    && rm -rf /tmp/${PHP_EXT_MSGPACK} \
#    && pcel download $PHP_EXT_MEMCACHED 
    && curl -O http://pecl.php.net/get/${PHP_EXT_MEMCACHED}.tgz \
    && mkdir -p /tmp/$PHP_EXT_MEMCACHED \
    && tar -xf ${PHP_EXT_MEMCACHED}.tgz -C /tmp/$PHP_EXT_MEMCACHED --strip-componets=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_MEMCACHED \
    && rm -rf /tmp/${PHP_EXT_MEMCACHED} \

    && docker-php-source delete

