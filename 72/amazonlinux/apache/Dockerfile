FROM amazonlinux:1

RUN yum update -y && yum install -y \
    php72 php72-devel.x86_64 \
    php72-bcmath.x86_64 \
    php72-cli.x86_64 \
    php72-common.x86_64 \
    php72-gd.x86_64 \
    php72-gmp.x86_64 \
    php72-intl.x86_64 \
    php72-mbstring.x86_64 \
    php72-mcrypt.x86_64 \
    php72-mysqlnd.x86_64 \
    php72-pdo.x86_64 \
    php72-pdo-dblib.x86_64 \
    php72-pecl-igbinary.x86_64 \
    php72-pecl-imagick.x86_64 \
    php72-pecl-memcache.x86_64 \
    php72-pecl-memcached.x86_64 \
    php72-pecl-redis.x86_64 \
    php72-pecl-xdebug.x86_64 \
    php72-pgsql.x86_64 \
    php72-process.x86_64 \
    php72-pspell.x86_64 \
    php72-recode.x86_64 \
    php72-soap.x86_64 \
    php72-xml.x86_64 \
    php72-xmlrpc.x86_64 \
    httpd24 mod24_ssl

RUN mkdir /var/www/ssl/ && \
    openssl req -subj '/CN=flipboxdigital.com/O=Flipbox Digital/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /var/www/ssl/self-signed.key -out /var/www/ssl/self-signed.crt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    #hopefully this would speed some things up
    composer global require hirak/prestissimo

COPY scripts/ /usr/local/bin/
RUN ["chmod", "+x", "-R", "/usr/local/bin"]

#Configurable XDEBUG options
ENV XDEBUG_FILE_PATH=/etc/php.d/15-xdebug.ini
ENV XDEBUG_ON ''
ENV XDEBUG_HOST ''
ENV XDEBUG_PORT ''
ENV XDEBUG_IDEKEY ''

#configure your doc root
ENV APACHE_DOCUMENT_ROOT /var/www/html

COPY noindex.html /var/www/noindex/flipbox-noindex.html

ENTRYPOINT ["docker-entrypoint.sh"]

CMD apache-foreground.sh

#php72-bcmath.x86_64                   7.2.5-1.4.amzn1               amzn-updates
#php72-dba.x86_64                      7.2.5-1.4.amzn1               amzn-updates
#php72-dbg.x86_64                      7.2.5-1.4.amzn1               amzn-updates
#php72-devel.x86_64                    7.2.5-1.4.amzn1               amzn-updates
#php72-embedded.x86_64                 7.2.5-1.4.amzn1               amzn-updates
#php72-enchant.x86_64                  7.2.5-1.4.amzn1               amzn-updates
#php72-fpm.x86_64                      7.2.5-1.4.amzn1               amzn-updates
#php72-gd.x86_64                       7.2.5-1.4.amzn1               amzn-updates
#php72-gmp.x86_64                      7.2.5-1.4.amzn1               amzn-updates
#php72-imap.x86_64                     7.2.5-1.4.amzn1               amzn-updates
#php72-intl.x86_64                     7.2.5-1.4.amzn1               amzn-updates
#php72-ldap.x86_64                     7.2.5-1.4.amzn1               amzn-updates
#php72-mbstring.x86_64                 7.2.5-1.4.amzn1               amzn-updates
#php72-mysqlnd.x86_64                  7.2.5-1.4.amzn1               amzn-updates
#php72-odbc.x86_64                     7.2.5-1.4.amzn1               amzn-updates
#php72-opcache.x86_64                  7.2.5-1.4.amzn1               amzn-updates
#php72-pdo.x86_64                      7.2.5-1.4.amzn1               amzn-updates
#php72-pdo-dblib.x86_64                7.2.5-1.4.amzn1               amzn-updates
#php72-pecl-apcu.x86_64                5.1.8-2.7.amzn1               amzn-updates
#php72-pecl-apcu-devel.x86_64          5.1.8-2.7.amzn1               amzn-updates
#php72-pecl-igbinary.x86_64            1.2.2-0.1.20151217git2b7c703.8.amzn1
#php72-pecl-igbinary-devel.x86_64      1.2.2-0.1.20151217git2b7c703.8.amzn1
#php72-pecl-imagick.x86_64             3.4.3-1.7.amzn1               amzn-updates
#php72-pecl-imagick-devel.x86_64       3.4.3-1.7.amzn1               amzn-updates
#php72-pecl-mcrypt.x86_64              1.0.1-3.5.amzn1               amzn-updates
#php72-pecl-memcache.x86_64            3.0.9-0.4.20160311git4991c2f.11.amzn1
#php72-pecl-memcached.x86_64           3.0.0-0.1.20160217git6ace07d.5.amzn1
#php72-pecl-oauth.x86_64               2.0.2-1.5.amzn1               amzn-updates
#php72-pecl-ssh2.x86_64                1.0-5.19.amzn1                amzn-updates
#php72-pecl-uuid.x86_64                1.0.4-7.3.amzn1               amzn-updates
#php72-pgsql.x86_64                    7.2.5-1.4.amzn1               amzn-updates
#php72-pspell.x86_64                   7.2.5-1.4.amzn1               amzn-updates
#php72-recode.x86_64                   7.2.5-1.4.amzn1               amzn-updates
#php72-snmp.x86_64                     7.2.5-1.4.amzn1               amzn-updates
#php72-soap.x86_64                     7.2.5-1.4.amzn1               amzn-updates
#php72-tidy.x86_64                     7.2.5-1.4.amzn1               amzn-updates
#php72-xmlrpc.x86_64                   7.2.5-1.4.amzn1               amzn-updates
