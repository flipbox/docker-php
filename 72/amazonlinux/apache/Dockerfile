FROM amazonlinux:2017.12

RUN yum update -y && \
    yum install -y httpd mod_ssl && \
    amazon-linux-extras install php7.2

RUN mkdir /var/www/ssl/ && \
    openssl req -subj '/CN=flipboxdigital.com/O=Flipbox Digital/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /var/www/ssl/self-signed.key -out /var/www/ssl/self-signed.crt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD service httpd start && tail -f /var/log/httpd/error_log
