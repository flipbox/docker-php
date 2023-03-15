#!/bin/sh

## MAIN CONFIGS
{
    #push errors to stderr
    echo 'opcache.enable_cli=On'; \
    echo 'log_errors=On'; \
    echo 'error_log=/dev/stderr'; \
    echo "memory_limit=${PHP_INI_MEMORY_LIMIT}"; \
    echo "upload_max_filesize=${PHP_INI_UPLOAD_MAX_FILESIZE}"; \
    echo "max_input_time=${PHP_INI_MAX_INPUT_TIME}"; \
    echo "post_max_size=${PHP_INI_POST_MAX_SIZE}"; \
    echo "max_input_vars=${PHP_INI_MAX_INPUT_VARS}"; \
    echo "max_execution_time=${PHP_INI_MAX_EXECUTION_TIME}"; \
} | tee /usr/local/etc/php/conf.d/flipbox.ini > /dev/null

