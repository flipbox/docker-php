build71AmazonLinux:
	docker build 71/amazonlinux/apache/ --pull -t flipbox/php:71-amazonlinux-apache
build72AmazonLinux:
	docker build 72/amazonlinux/apache/ --pull -t flipbox/php:72-amazonlinux-apache
build72Apache:
	docker build 72/apache --pull -t flipbox/php:72-apache
build73Apache:
	docker build 73/apache --pull -t flipbox/php:73-apache
