#! /usr/bin/bash
DIRECTORY=/var/lib/mysql
if [ "`ls -A $DIRECTORY`" = "" ]; then
/usr/bin/mysql_install_db --user=mysql
fi

/usr/sbin/init & /usr/sbin/nginx & /usr/sbin/php-fpm & redis-server /etc/redis.conf & /usr/bin/mysqld_safe --basedir=/usr
