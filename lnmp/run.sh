#! /usr/bin/bash
/usr/sbin/init & /usr/sbin/nginx & /usr/sbin/php-fpm & redis-server & /usr/bin/mysqld_safe --basedir=/usr
