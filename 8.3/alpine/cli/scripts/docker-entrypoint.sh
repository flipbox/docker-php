#!/bin/sh
set -e

#TODO AWS_PARAMATER_STORE_PATH here

sh /usr/local/bin/php-ini.sh

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php "$@"
fi

exec "$@"
