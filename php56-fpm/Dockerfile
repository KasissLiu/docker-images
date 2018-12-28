#基于php5.6-fpm镜像
FROM php:5.6-fpm
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
    && docker-php-ext-install -j$(nproc) calendar \
    && docker-php-ext-install -j$(nproc) sysvsem \
    && docker-php-ext-install -j$(nproc) sysvmsg \
    && docker-php-ext-install -j$(nproc) sysvshm  


#安装gd intl gettext exif mycrypt soap扩展
RUN apt-get update && apt-get install -y \
        libsodium-dev \
        libxml2-dev \
        libxml2 \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libicu-dev \
	libxslt-dev \
    && docker-php-ext-install -j$(nproc) soap  iconv xsl mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd intl gettext exif 

    
#定义swoole和yaf版本号常量
ENV PHP_EXT_SWOOLE=swoole-1.9.8 PHP_EXT_YAF=yaf-2.3.5 PHP_EXT_REDIS=redis-3.1.6 PHP_EXT_MONGO=mongodb-1.4.1 PHP_EXT_IGBINARY=igbinary-2.0.7 PHP_EXT_MSGPACK=msgpack-0.5.7 PHP_EXT_MEMCACHED=memcached-2.2.0 
#下载安装swoole yaf redis mongo 扩展
RUN cd /tmp \
#    && pecl download $PHP_EXT_SWOOLE \
    && apt update && apt install libssl-dev -y \
    && curl -O http://pecl.php.net/get/${PHP_EXT_SWOOLE}.tgz \
    && mkdir -p /tmp/$PHP_EXT_SWOOLE \
    && tar -xf ${PHP_EXT_SWOOLE}.tgz -C /tmp/$PHP_EXT_SWOOLE --strip-components=1 \
    && docker-php-ext-configure /tmp/$PHP_EXT_SWOOLE  --enable-openssl \
    && docker-php-ext-install /tmp/$PHP_EXT_SWOOLE \
    && rm -rf /tmp/${PHP_EXT_SWOOLE}* \
#    && pecl download $PHP_EXT_MEMCACHED 
    && apt update && apt install libmemcached-dev -y \
    && curl -O http://pecl.php.net/get/${PHP_EXT_MEMCACHED}.tgz \
    && mkdir -p /tmp/$PHP_EXT_MEMCACHED \
    && tar -xf ${PHP_EXT_MEMCACHED}.tgz -C /tmp/$PHP_EXT_MEMCACHED --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_MEMCACHED \
    && rm -rf /tmp/${PHP_EXT_MEMCACHED} \

#    && pecl download $PHP_EXT_IGBINARY
    && curl -O http://pecl.php.net/get/${PHP_EXT_IGBINARY}.tgz \
    && mkdir -p /tmp/$PHP_EXT_IGBINARY \
    && tar -xf ${PHP_EXT_IGBINARY}.tgz -C /tmp/$PHP_EXT_IGBINARY --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_IGBINARY \
    && rm -rf /tmp/${PHP_EXT_IGBINARY} \
#    && pecl download $PHP_EXT_MSGPACK
    && curl -O http://pecl.php.net/get/${PHP_EXT_MSGPACK}.tgz \
    && mkdir -p /tmp/$PHP_EXT_MSGPACK \
    && tar -xf ${PHP_EXT_MSGPACK}.tgz -C /tmp/$PHP_EXT_MSGPACK --strip-components=1 \
    && docker-php-ext-install /tmp/$PHP_EXT_MSGPACK \
    && rm -rf /tmp/${PHP_EXT_MSGPACK} \
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

    && docker-php-source delete

# 安装composer并允许root用户运行
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_NO_INTERACTION=1
ENV COMPOSER_HOME=/usr/local/share/composer
RUN mkdir -p /usr/local/share/composer \
    && curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
    && rm -f /tmp/composer-setup.* \
    # 配置composer中国全量镜像
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

# 对其他容器开放9000端口
EXPOSE 9000
