FROM sdal/ngx-ldap-ssh-c7
MAINTAINER Aaron D. Schroeder <dads2busy@gmail.com>

RUN yum -y install wget nano

RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php71 && \
    yum -y install php php-opcache

RUN cd /etc/nginx/html && \
    wget -O index.php https://www.adminer.org/latest.php

RUN systemctl enable nginx

EXPOSE 80

CMD ["/lib/systemd/systemd"]
