# Nginx for PHP-FPM Docker Container Image 

[![Build Status](https://travis-ci.org/wodby/php-nginx.svg?branch=master)](https://travis-ci.org/wodby/php-nginx)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/php-nginx.svg)](https://hub.docker.com/r/wodby/php-nginx)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/php-nginx.svg)](https://hub.docker.com/r/wodby/php-nginx)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Docker Images

* All images are based on Alpine Linux
* Base image: [wodby/nginx](https://github.com/wodby/nginx)
* [Travis CI builds](https://travis-ci.org/wodby/php-nginx) 
* [Docker Hub](https://hub.docker.com/r/wodby/php-nginx)

Supported tags and respective `Dockerfile` links:

* `1.13`, `latest` [_(Dockerfile)_](https://github.com/wodby/php-nginx/tree/master/Dockerfile)
* `1.12` [_(Dockerfile)_](https://github.com/wodby/php-nginx/tree/master/Dockerfile)

For better reliability we additionally release images with stability tags (`wodby/php-nginx:1.13-X.X.X`) which correspond to [git tags](https://github.com/wodby/php-nginx/release). We **strongly recommend** using images only with stability tags. 

## Environment Variables

See more at [wodby/nginx](https://github.com/wodby/nginx)

| Variable                       | Default Value  | Description |
| ------------------------------ | -------------- | ----------- |
| NGINX_BACKEND_HOST             | php            |             |
| NGINX_SERVER_NAME              | default        |             |
| NGINX_SERVER_ROOT              | /var/www/html/ |             |
| NGINX_FASTCGI_BUFFERS          | 16 32k         |             |
| NGINX_FASTCGI_BUFFER_SIZE      | 32k            |             |
| NGINX_FASTCGI_INTERCEPT_ERRORS | on             |             |
| NGINX_FASTCGI_READ_TIMEOUT     | 900            |             |