ARG NGINX_VER

FROM wodby/nginx:${NGINX_VER}

ENV WODBY_DIR_FILES="/mnt/files" \
    NGINX_USER="www-data"

USER root

RUN deluser nginx && \
    addgroup -S -g 82 www-data && \
    adduser -u 82 -D -S -s /bin/bash -G www-data www-data && \
    mkdir -p $WODBY_DIR_FILES && \
    chown -R www-data:www-data /etc/nginx && \

    # Configure sudoers
    { \
        echo -n 'www-data ALL=(root) NOPASSWD: ' ; \
        echo -n '/usr/local/bin/fix-permissions.sh, ' ; \
        echo '/usr/sbin/nginx' ; \
    } | tee /etc/sudoers.d/www-data && \
    rm /etc/sudoers.d/nginx

USER www-data

COPY templates /etc/gotpl/
COPY init /docker-entrypoint-init.d/