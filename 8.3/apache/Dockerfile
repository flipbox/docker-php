FROM php:8.3-apache

COPY scripts/ /usr/local/bin/
COPY health.html noindex.html /var/www/extra/
COPY php.ini /usr/local/etc/php/conf.d/flipbox.ini

ENV DOT_ENV_VERSION='1.1.10'

ADD https://github.com/flipboxlabs/aws.env/archive/${DOT_ENV_VERSION}.zip /opt/

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# set php.ini defaults -- override with env vars
ARG PHP_MAX_EXECUTION_TIME_ARG="120" 
ARG PHP_MAX_INPUT_VARS_ARG="1000" 
ARG PHP_MEMORY_LIMIT_ARG="256M" 
ARG PHP_MAX_INPUT_TIME="300"
ARG PHP_OPCACHE_ENABLE_ARG="1" 
ARG PHP_OPCACHE_FAST_SHUTDOWN_ARG="1" 
ARG PHP_OPCACHE_INTERNED_STRINGS_BUFFER_ARG="16" 
ARG PHP_OPCACHE_MAX_ACCELERATED_FILES_ARG="10000" 
ARG PHP_OPCACHE_MAX_WASTED_PERCENTAGE_ARG="10" 
ARG PHP_OPCACHE_MEMORY_CONSUMPTION_ARG="128" 
ARG PHP_OPCACHE_REVALIDATE_FREQ_ARG="0" 
ARG PHP_OPCACHE_VALIDATE_TIMESTAMPS_ARG="0" 
ARG PHP_POST_MAX_SIZE_ARG="8M" 
ARG PHP_REGISTER_ARGC_ARGV="0" 
ARG PHP_UPLOAD_MAX_FILESIZE_ARG="20M"
ARG APACHE_DOCUMENT_ROOT=/var/www/html/web

ENV APACHE_DOCUMENT_ROOT=${APACHE_DOCUMENT_ROOT} \
    PATH="${PATH}:/opt/aws.env-${DOT_ENV_VERSION}/bin/" \
    PHP_MAX_EXECUTION_TIME=${PHP_MAX_EXECUTION_TIME_ARG} \
    PHP_MAX_INPUT_TIME=${PHP_MAX_INPUT_TIME} \
    PHP_MAX_INPUT_VARS=${PHP_MAX_INPUT_VARS_ARG} \
    PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT_ARG} \
    PHP_OPCACHE_ENABLE=$PHP_OPCACHE_ENABLE_ARG \
    PHP_OPCACHE_FAST_SHUTDOWN=$PHP_OPCACHE_FAST_SHUTDOWN_ARG \
    PHP_OPCACHE_INTERNED_STRINGS_BUFFER=$PHP_OPCACHE_INTERNED_STRINGS_BUFFER_ARG \
    PHP_OPCACHE_MAX_ACCELERATED_FILES=$PHP_OPCACHE_MAX_ACCELERATED_FILES_ARG \
    PHP_OPCACHE_MAX_WASTED_PERCENTAGE=$PHP_OPCACHE_MAX_WASTED_PERCENTAGE_ARG \
    PHP_OPCACHE_MEMORY_CONSUMPTION=$PHP_OPCACHE_MEMORY_CONSUMPTION_ARG \
    PHP_OPCACHE_REVALIDATE_FREQ=$PHP_OPCACHE_REVALIDATE_FREQ_ARG \
    PHP_OPCACHE_VALIDATE_TIMESTAMPS=$PHP_OPCACHE_VALIDATE_TIMESTAMPS_ARG \
    PHP_POST_MAX_SIZE=${PHP_POST_MAX_SIZE_ARG} \
    PHP_REGISTER_ARGC_ARGV=${PHP_REGISTER_ARGC_ARGV} \
    PHP_UPLOAD_MAX_FILESIZE=${PHP_UPLOAD_MAX_FILESIZE_ARG} \
    XDEBUG_FILE_PATH='/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini' \
    XDEBUG_ON='' \
    XDEBUG_HOST='' \
    XDEBUG_PORT='' \
    XDEBUG_IDEKEY=''


RUN chmod +x -R /usr/local/bin && \
    apt-get update -y && \
    apt-get install -y \
        awscli \
        jq \
        git \
        unzip \
        libpq-dev \
        zlib1g-dev \
        libzip-dev \
        libmagickwand-dev \
        && \
    ##apache
    a2enmod ssl expires rewrite proxy proxy_http && \
    docker-php-ext-install gd bcmath intl pdo_pgsql pdo_mysql zip soap pcntl && \
    pecl install xdebug && \
    pecl install -o -f redis  && \
    docker-php-ext-enable redis bcmath intl gd imagick xdebug opcache sodium soap pcntl && \
    rm -rf /tmp/pear && \
    # Add a hooks directory
    mkdir /flipbox.d/ && \
    unzip "/opt/${DOT_ENV_VERSION}.zip" -d /opt/ && \
    export PATH="${PATH}:/opt/aws.env-${DOT_ENV_VERSION}/bin/" && \
    dotenv

#Add dotenv to the path
ENV PATH="${PATH}:/opt/aws.env-${DOT_ENV_VERSION}/bin/"

#Configurable XDEBUG options
ENV XDEBUG_ON=''
ENV XDEBUG_HOST=''
ENV XDEBUG_PORT=''
ENV XDEBUG_IDEKEY=''

ENV XDEBUG_FILE_PATH='/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'


##===========================================================##
## AWS PARAMETER STORE
##===========================================================##
ENV AWS_PARAMETER_PATH=''

#configure your doc root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/web

ENTRYPOINT ["docker-entrypoint"]

EXPOSE 80 443

CMD ["apache2-foreground"]
