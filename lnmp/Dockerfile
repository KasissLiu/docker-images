FROM centos:latest
LABEL author="kasiss"
LABEL email="xueyezhishang@163.com"
#添加软件源
ADD extends.repo /etc/yum.repos.d/extends.repo

#安装nginx
RUN yum install -y nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/default.conf

#安装php5.6
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum install -y php56w.x86_64 php56w-cli.x86_64 php56w-common.x86_64 php56w-gd.x86_64 php56w-ldap.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 php56w-pdo.x86_64 php56w-fpm.x86_64

#添加php测试脚本
ADD test.php /usr/share/nginx/html/index.php
ADD yaf.so /usr/lib64/php/modules/yaf.so
ADD swoole.so /usr/lib64/php/modules/swoole.so

RUN echo -e "\nextension=yaf.so\nextension=swoole.so" >> /etc/php.ini

#安装mariadb
RUN yum install -y mariadb-server
RUN /usr/bin/mysql_install_db --user=mysql

#RUN echo "basedir=/usr" >> /etc/my.cnf

RUN yum install -y redis
RUN echo -e "daemonize yes\nprotected-mode no\nbind 0.0.0.0" >> /etc/redis.conf


ADD run.sh /run.sh
RUN chmod -R 755 /run.sh
CMD /run.sh