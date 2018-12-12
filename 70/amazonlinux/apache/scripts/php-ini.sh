#!/bin/sh

## This script shouldn't run if xdebug is off
## Always append to the existing xdebug file

## MAIN CONFIGS
{
    #push errors to stderr
    echo 'log_errors=On'; \
    echo 'error_log=/dev/stderr'; \
    echo 'memory_limit=256M'; \
    echo 'upload_max_filesize=100M'; \
    echo 'max_input_time=300'; \
    echo 'post_max_size=110M'; \
    echo 'max_input_vars=5000'; \
} | tee /etc/php.d/flipbox.ini

