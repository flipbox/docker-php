VERSION=74

build-apache:
	docker build $(VERSION)/apache --pull -t flipbox/php:$(VERSION)-apache


build70AmazonLinux:
	docker build 70/amazonlinux/apache/ --pull -t flipbox/php:70-amazonlinux-apache
build71AmazonLinux:
	docker build 71/amazonlinux/apache/ --pull -t flipbox/php:71-amazonlinux-apache
build72AmazonLinux:
	docker build 72/amazonlinux/apache/ --pull -t flipbox/php:72-amazonlinux-apache
build72Apache:
	docker build 72/apache --pull -t flipbox/php:72-apache
build73Apache:
	docker build 73/apache --pull -t flipbox/php:73-apache
build73Cli:
	docker build 73/alpine/cli/ --pull -t flipbox/php:73-cli
