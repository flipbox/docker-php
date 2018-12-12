FROM php:7.2-cli

COPY scripts/ /usr/local/bin/

RUN chmod +x -R /usr/local/bin && \
    apt-get update -y && \
    apt-get install -y \
    unzip \
    libpq-dev \
    zlib1g-dev \
    libmagickwand-dev \
    && \
    docker-php-ext-install intl pdo_pgsql pdo_mysql zip && \
    pecl install imagick xdebug-2.6.0alpha1 && \
    docker-php-ext-enable imagick xdebug opcache sodium && \
    pecl install -o -f redis && \
    rm -rf /tmp/pear && \
    docker-php-ext-enable redis && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    #hopefully this would speed some things up
    composer global require hirak/prestissimo

#Configurable XDEBUG options
ENV XDEBUG_ON ''
ENV XDEBUG_HOST ''
ENV XDEBUG_PORT ''
ENV XDEBUG_IDEKEY ''

ENV XDEBUG_FILE_PATH='/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php", "-a"]
