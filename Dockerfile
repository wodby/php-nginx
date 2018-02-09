ARG BASE_IMAGE_TAG

FROM wodby/nginx:${BASE_IMAGE_TAG}

ENV FILES_DIR="/mnt/files"

USER root

RUN set -ex; \
    \
	addgroup -g 1000 -S wodby; \
	adduser -u 1000 -D -S -s /bin/bash -G wodby wodby; \
    \
    mkdir -p "${FILES_DIR}"; \
    \
    # Script to fix volumes permissions via sudo.
    echo "chown wodby:wodby ${HTML_DIR} ${FILES_DIR}" > /usr/local/bin/fix-volumes-permissions.sh; \
    chmod +x /usr/local/bin/fix-volumes-permissions.sh; \
    \
    # Configure sudoers
    { \
        echo -n 'wodby ALL=(root) NOPASSWD: '; \
        echo -n '/usr/local/bin/fix-volumes-permissions.sh, ' ; \
        echo '/usr/sbin/nginx'; \
    } | tee /etc/sudoers.d/wodby; \
    rm /etc/sudoers.d/nginx

USER wodby

COPY templates /etc/gotpl/
COPY init /docker-entrypoint-init.d/