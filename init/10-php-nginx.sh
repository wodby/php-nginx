#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

gotpl /etc/gotpl/fastcgi.conf.tpl > /etc/nginx/fastcgi.conf
