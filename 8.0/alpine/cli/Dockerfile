FROM php:7.3-cli-alpine

COPY scripts/ /usr/local/bin/

# mysqli, pdo, pdo_mysql, pdo_pgsql
RUN chmod +x -R /usr/local/bin/ \
    && apk add --update --no-cache postgresql-dev \
        libintl libsodium-dev libzip-dev icu icu-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql intl zip soap sodium \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    #hopefully this would speed some things up
    && composer global require hirak/prestissimo

## AWS PARAMETER STORE
## Description:
##      Supply a path to the container and it'll fetch the parameters and export them as environmental variables
##      during startup via the ENTRYPOINT.
## Note:
##      The container needs access to the aws parameters so make sure to supply them accordingly.
##      It's recommended supply proper authorization to the task role when running the container via ECS for example.
ENV AWS_PARAMATER_STORE_PATH ''

#Configurable XDEBUG options
ENV XDEBUG_ON ''
ENV XDEBUG_HOST ''
ENV XDEBUG_PORT ''
ENV XDEBUG_IDEKEY ''

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["php", "-a"]
