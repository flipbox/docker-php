FROM php:7.2-fpm
RUN apt-get update -y && \ 
    apt-get install -y \
    libpq-dev \
    zlib1g-dev \
    libmagickwand-dev \
    && \
    docker-php-ext-install intl pdo_pgsql pdo_mysql zip && \
    pecl install imagick xdebug-2.6.0alpha1 && \
    docker-php-ext-enable imagick xdebug
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
CMD ["php-fpm"]
