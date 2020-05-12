#!/bin/sh
set -e

#configure xdebug is this is set
if [ -n "$XDEBUG_ON" ]; then
    sh /usr/local/bin/x-debug.sh
else
    #remove the ini if we don't want it on
    rm -f $XDEBUG_FILE_PATH
fi

sh /usr/local/bin/php-ini.sh
sh /usr/local/bin/httpd.sh

if [ ! -e /var/www/ssl/self-signed.key ]; then
    mkdir /var/www/ssl/ && \
        openssl req -subj '/CN=flipboxdigital.com/O=Flipbox Digital/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /var/www/ssl/self-signed.key -out /var/www/ssl/self-signed.crt
fi


if [ -e /var/www/html/storage ]; then
    chown root:root -R /var/www/html/storage
fi

if [ -e /var/www/html/config ]; then
    chown root:root -R /var/www/html/config
fi

if [ -e /var/www/html/web ]; then
    chown root:root -R /var/www/html/web
fi

# first arg is `-f` or `--some-option`
if [ "$1" = 'apache2-foreground.sh' ]; then
    exec apache2-foreground.sh
fi

exec "$@"
