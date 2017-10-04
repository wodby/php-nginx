# Nginx for PHP-FPM Docker Container Image 

[![Build Status](https://travis-ci.org/wodby/php-nginx.svg?branch=master)](https://travis-ci.org/wodby/php-nginx)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/php-nginx.svg)](https://hub.docker.com/r/wodby/php-nginx)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/php-nginx.svg)](https://hub.docker.com/r/wodby/php-nginx)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Docker Images

Images are based on [wodby/nginx](https://github.com/wodby/nginx), built via [Travis CI](https://travis-ci.org/wodby/php-nginx) and published on [Docker Hub](https://hub.docker.com/r/wodby/php-nginx). 

## Versions

| Image Tag (Dockerfile)                                                  | Nginx   | Alpine |
| ----------------------------------------------------------------------- | ------- | ------ |
| [1.13](https://github.com/wodby/php-nginx/tree/master/4/1.x/Dockerfile) | 1.13.5  | 3.6    |
| [1.12](https://github.com/wodby/php-nginx/tree/master/4/1.x/Dockerfile) | 1.12/1  | 3.6    |

## Environment Variables

See more at [wodby/nginx](https://github.com/wodby/nginx)

| Variable                       | Default Value | Description |
| ------------------------------ | ------------- | ----------- |
| NGINX_BACKEND_HOST             | php           |             |
| NGINX_SERVER_NAME              | default       |             |
| NGINX_SERVER_ROOT              | /var/www/html |             |
| NGINX_FASTCGI_BUFFERS          | 16 32k        |             |
| NGINX_FASTCGI_BUFFER_SIZE      | 32k           |             |
| NGINX_FASTCGI_INTERCEPT_ERRORS | on            |             |
| NGINX_FASTCGI_READ_TIMEOUT     | 900           |             |