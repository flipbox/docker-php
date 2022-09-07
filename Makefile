VERSION=8.0
TAG=flipbox/php:$(VERSION)-apache
AWS_DEFAULT_PROFILE=flipbox

build-apache:
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		$(VERSION)/apache --pull -t $(TAG) --push

build-and-push:
	./build-push-public-aws-image $(TAG) $(VERSION) --profile $(AWS_DEFAULT_PROFILE)

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
