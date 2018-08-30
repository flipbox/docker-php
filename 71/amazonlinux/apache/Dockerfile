FROM amazonlinux:1

RUN yum install -y php71 php71-devel.x86_64 \
    php71-bcmath.x86_64 \
    php71-cli.x86_64 \
    php71-common.x86_64 \
    php71-gd.x86_64 \
    php71-gmp.x86_64 \
    php71-intl.x86_64 \
    php71-mbstring.x86_64 \
    php71-mcrypt.x86_64 \
    php71-mysqlnd.x86_64 \
    php71-pdo.x86_64 \
    php71-pdo-dblib.x86_64 \
    php71-pecl-igbinary.x86_64 \
    php71-pecl-imagick.x86_64 \
    php71-pecl-memcache.x86_64 \
    php71-pecl-memcached.x86_64 \
    php71-pecl-redis.x86_64 \
    php71-pecl-xdebug.x86_64 \
    php71-pgsql.x86_64 \
    php71-process.x86_64 \
    php71-pspell.x86_64 \
    php71-recode.x86_64 \
    php71-soap.x86_64 \
    php71-xml.x86_64 \
    php71-xmlrpc.x86_64 \
    httpd24 mod24_ssl

RUN mkdir /var/www/ssl/ && \
    openssl req -subj '/CN=flipboxdigital.com/O=Flipbox Digital/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /var/www/ssl/self-signed.key -out /var/www/ssl/self-signed.crt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    #hopefully this would speed some things up
    composer global require hirak/prestissimo

COPY scripts/ /usr/local/bin/
RUN ["chmod", "+x", "-R", "/usr/local/bin"]

#Configurable XDEBUG options
ENV XDEBUG_FILE_PATH=/etc/php.d/15-xdebug.ini
ENV XDEBUG_ON ''
ENV XDEBUG_HOST ''
ENV XDEBUG_PORT ''
ENV XDEBUG_IDEKEY ''

#configure your doc root
ENV APACHE_DOCUMENT_ROOT /var/www/html

COPY noindex.html /var/www/noindex/flipbox-noindex.html

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["apache-foreground.sh"]
