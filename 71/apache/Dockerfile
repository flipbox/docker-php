FROM php:7.1-apache

COPY scripts/ /usr/local/bin/
COPY health.html noindex.html /var/www/extra/

RUN chmod +x -R /usr/local/bin && \
    apt-get update -y && \
    apt-get install -y \
        unzip \
        libmcrypt-dev \
        libpq-dev \
        zlib1g-dev \
        libmagickwand-dev && \
    ##apache
    a2enmod ssl && \
    a2enmod expires && \
    a2enmod rewrite && \
    docker-php-ext-install intl pdo_pgsql pdo_mysql zip mcrypt && \
    pecl install imagick xdebug-2.6.0alpha1 && \
    docker-php-ext-enable imagick xdebug opcache mcrypt && \
    pecl install -o -f redis && \
    rm -rf /tmp/pear && \
    docker-php-ext-enable redis 

#Configurable XDEBUG options
ENV XDEBUG_ON ''
ENV XDEBUG_HOST ''
ENV XDEBUG_PORT ''
ENV XDEBUG_IDEKEY ''

ENV XDEBUG_FILE_PATH='/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'

#configure your doc root
ENV APACHE_DOCUMENT_ROOT /var/www/html/web

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["apache2-foreground"]
