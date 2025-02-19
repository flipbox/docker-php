#!/bin/sh

## MAIN CONFIGS
{
    #push errors to stderr
    echo 'log_errors=On'; \
    echo 'error_log=/dev/stderr'; \
    echo 'memory_limit=512M'; \
    echo 'upload_max_filesize=100M'; \
    echo 'max_input_time=300'; \
    echo 'post_max_size=110M'; \
    echo 'max_input_vars=5000'; \
} | tee /usr/local/etc/php/conf.d/flipbox.ini > /dev/null

