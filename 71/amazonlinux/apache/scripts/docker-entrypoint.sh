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

exec httpd -DFOREGROUND
