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
# FROM php:7.2-fpm-alpine
# RUN set -ex \
#   && apk --no-cache add \
#     postgresql-dev \
#     gcc \
#     imagemagick \
#     zlib-dev \
#     && apk add --update --virtual autoconf \
#     && apk add --no-cache --virtual .imagemagick-edge imagemagick imagemagick-dev \
#     && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS"
# RUN docker-php-ext-install pdo_pgsql pdo_mysql zip \
#     && pecl install imagick-3.4.3 xdebug \
#     && docker-php-ext-enable imagick xdebug
