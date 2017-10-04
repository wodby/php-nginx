#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

sudo fix-permissions.sh www-data www-data "${HTML_DIR}" "${WODBY_DIR_FILES}"

gotpl /etc/gotpl/fastcgi.conf.tpl > /etc/nginx/fastcgi.conf
