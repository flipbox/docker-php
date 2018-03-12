FROM amazonlinux:latest

RUN yum install -y php56 php56-devel.x86_64 \
    php56-bcmath.x86_64 \
    php56-cli.x86_64 \
    php56-common.x86_64 \
    php56-gd.x86_64 \
    php56-gmp.x86_64 \
    php56-zip.x86_64 \
    php56-intl.x86_64 \
    php56-mbstring.x86_64 \
    php56-mcrypt.x86_64 \
    php56-mysqlnd.x86_64 \
    php56-pdo.x86_64 \
    php56-pdo-dblib.x86_64 \
    php56-pecl-igbinary.x86_64 \
    php56-pecl-imagick.x86_64 \
    php56-pecl-memcache.x86_64 \
    php56-pecl-memcached.x86_64 \
    php56-pecl-redis.x86_64 \
    php56-pecl-xdebug.x86_64 \
    php56-pgsql.x86_64 \
    php56-process.x86_64 \
    php56-pspell.x86_64 \
    php56-recode.x86_64 \
    php56-soap.x86_64 \
    php56-xml.x86_64 \
    php56-xmlrpc.x86_64 \
    httpd24 mod24_ssl

RUN mkdir /var/www/ssl/ && \
    openssl req -subj '/CN=flipboxdigital.com/O=Flipbox Digital/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /var/www/ssl/self-signed.key -out /var/www/ssl/self-signed.crt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD service httpd start && tail -f /var/log/httpd/error_log
