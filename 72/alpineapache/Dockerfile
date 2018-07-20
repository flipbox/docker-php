FROM php:7.2.5-alpine
RUN set -ex \
  && apk --no-cache add \
    libsodium-dev \
    zlib-dev \
    && apk add --update --virtual autoconf \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS"

# mysqli, pdo, pdo_mysql, pdo_pgsql
RUN apk add --update --no-cache postgresql-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql

# intl, zip, soap
RUN apk add --update --no-cache libintl icu icu-dev libxml2-dev \
    && docker-php-ext-install intl zip soap sodium

# imagick
RUN apk add --update --no-cache autoconf g++ imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD service httpd start && tail -f /var/log/httpd/error_log
