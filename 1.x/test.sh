#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

nginx_exec() {
    docker-compose -f test/docker-compose.yml exec nginx "${@}"
}

docker-compose -f test/docker-compose.yml up -d

nginx_exec make check-ready max_try=10 -f /usr/local/bin/actions.mk
nginx_exec sh -c 'echo "<?php echo '\''Hello World!'\'';" > /var/www/html/index.php'

echo -n "Checking php endpoint... "
nginx_exec curl "localhost" | grep -q "Hello World!"
echo "OK"

docker-compose -f test/docker-compose.yml down