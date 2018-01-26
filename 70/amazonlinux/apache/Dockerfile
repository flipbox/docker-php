FROM amazonlinux:latest

RUN yum install -y php70 php70-devel.x86_64 \
    php70-bcmath.x86_64 \
    php70-cli.x86_64 \
    php70-common.x86_64 \
    php70-gd.x86_64 \
    php70-gmp.x86_64 \
    php70-zip.x86_64 \
    php70-intl.x86_64 \
    php70-mbstring.x86_64 \
    php70-mcrypt.x86_64 \
    php70-mysqlnd.x86_64 \
    php70-pdo.x86_64 \
    php70-pdo-dblib.x86_64 \
    php70-pecl-igbinary.x86_64 \
    php70-pecl-imagick.x86_64 \
    php70-pecl-memcache.x86_64 \
    php70-pecl-memcached.x86_64 \
    php70-pecl-redis.x86_64 \
    php70-pecl-xdebug.x86_64 \
    php70-pgsql.x86_64 \
    php70-process.x86_64 \
    php70-pspell.x86_64 \
    php70-recode.x86_64 \
    php70-soap.x86_64 \
    php70-xml.x86_64 \
    php70-xmlrpc.x86_64 \
    httpd24 mod24_ssl

RUN mkdir /var/www/ssl/ && \
    openssl req -subj '/CN=flipboxdigital.com/O=Flipbox Digital/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /var/www/ssl/self-signed.key -out /var/www/ssl/self-signed.crt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD service httpd start && tail -f /var/log/httpd/error_log
