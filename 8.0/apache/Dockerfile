FROM php:8.0-apache

COPY scripts/ /usr/local/bin/
COPY health.html noindex.html /var/www/extra/

ENV DOT_ENV_VERSION '1.1.10'

# set php.ini defaults -- override with env vars
ENV PHP_INI_MEMORY_LIMIT '256M'
ENV PHP_INI_UPLOAD_MAX_FILESIZE '100M'
ENV PHP_INI_MAX_INPUT_TIME '300'
ENV PHP_INI_POST_MAX_SIZE '110M'
ENV PHP_INI_MAX_INPUT_VARS '5000'
ENV PHP_INI_MAX_EXECUTION_TIME '120'

ADD https://github.com/flipboxlabs/aws.env/archive/${DOT_ENV_VERSION}.zip /opt/

COPY --from=composer /usr/bin/composer /usr/bin/composer

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
    pecl install imagick xdebug && \
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
ENV XDEBUG_ON ''
ENV XDEBUG_HOST ''
ENV XDEBUG_PORT ''
ENV XDEBUG_IDEKEY ''

ENV XDEBUG_FILE_PATH '/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'


##===========================================================##
## AWS PARAMETER STORE
##===========================================================##
ENV AWS_PARAMETER_PATH ''

#configure your doc root
ENV APACHE_DOCUMENT_ROOT /var/www/html/web

ENTRYPOINT ["docker-entrypoint"]

EXPOSE 80 443

CMD ["apache2-foreground"]
