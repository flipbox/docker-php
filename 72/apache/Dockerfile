FROM php:7.2-apache
RUN apt-get update -y && \ 
    apt-get install -y \
    libpq-dev \
    zlib1g-dev \
    libmagickwand-dev \
    && \
    a2enmod ssl \
    && \
    a2enmod rewrite \
    && \
    docker-php-ext-install intl pdo_pgsql pdo_mysql zip && \
    pecl install imagick xdebug-2.6.0alpha1 && \
    docker-php-ext-enable imagick xdebug opcache sodium

COPY scripts/ /usr/local/bin/
RUN ["chmod", "+x", "-R", "/usr/local/bin"]

#Configurable XDEBUG options
ENV XDEBUG_ON ''
ENV XDEBUG_HOST ''
ENV XDEBUG_PORT ''
ENV XDEBUG_IDEKEY ''

ENV XDEBUG_FILE_PATH='/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'

#configure your doc root
ENV APACHE_DOCUMENT_ROOT /var/www/html/web

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    #hopefully this would speed some things up
    composer global require hirak/prestissimo

RUN mkdir /var/www/ssl/ && \
    openssl req -subj '/CN=flipboxdigital.com/O=Flipbox Digital/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /var/www/ssl/self-signed.key -out /var/www/ssl/self-signed.crt

COPY noindex.html /var/www/noindex/flipbox-noindex.html

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["apache-foreground.sh"]
