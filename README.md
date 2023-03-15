# Flipbox Docker PHP Images

## Build and Deploy

### Push to Docker's Registry

```make build-apache```

### Push to AWS Registry

Use `./build-push-public-aws-image` to help push to the AWS registry.

Example:
```
./build-push-public-aws-image --profile flipbox flipbox/php:8.0-apache 8.0
```

## Environmental Variables

### PHP INI Setting (currently, 8.0-apache only)

You can override these php ini settings by setting an env var via sh export or 
using `ENV` in the Dockerfile or using the `environment:` setting in the 
`docker-compose.yml`

Defaults:
```
PHP_INI_MEMORY_LIMIT='256M'
PHP_INI_UPLOAD_MAX_FILESIZE='100M'
PHP_INI_MAX_INPUT_TIME='300'
PHP_INI_POST_MAX_SIZE='110M'
PHP_INI_MAX_INPUT_VARS='5000'
PHP_INI_MAX_EXECUTION_TIME='120'
```

### `AWS_PARAMETER_PATH`
Set the prefix for items (SecureString only) stored in the [AWS SSM Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html). The values will be pulled into the container (at runtime), loading them as environmental variables.

#### Example
Suppose you have a group of SecureString parameters stored in `/MyApp/StagingEnv/`. Some inlude the following:
- `/MyApp/StagingEnv/DB_PASSWORD`
- `/MyApp/StagingEnv/DB_USERNAME`

You can set the path: `AWS_PARAMETER_PATH=/MyApp/StagingEnv/`

You can then access those parameters via environmental variables:
```bash
echo $DB_PASSWORD
```

## Other Features

### Running Shell Scripts on Startup (`/flipbox.d/`)
Files found in `/flipbox.d/` with a `.sh` extension will be run at startup (using `bash my-script.sh`)

