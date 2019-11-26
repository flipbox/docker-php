#!/bin/sh

## This script shouldn't run if xdebug is off
## Always append to the existing xdebug file

## MAIN CONFIGS
{
    echo 'zend_extension=xdebug.so'; \
    echo 'xdebug.remote_enable=1'; \
} | tee $XDEBUG_FILE_PATH > /dev/null


## PORT
if [ -n "$XDEBUG_PORT" ]; then
    echo "xdebug.remote_port=${XDEBUG_PORT}" | tee -a $XDEBUG_FILE_PATH > /dev/null
fi

## IDEKEY
if [ -n "$XDEBUG_IDEKEY" ]; then
    echo "xdebug.idekey=${XDEBUG_IDEKEY}" | tee -a $XDEBUG_FILE_PATH > /dev/null
fi

## HOST
if [ -n "$XDEBUG_HOST" ]; then
    {
        echo 'xdebug.remote_connect_back=0'; \
        echo "xdebug.remote_host=${XDEBUG_HOST}"; \
    } | tee -a $XDEBUG_FILE_PATH > /dev/null
else
    {
        echo 'xdebug.remote_connect_back=1'; \
    } | tee -a $XDEBUG_FILE_PATH > /dev/null
fi

