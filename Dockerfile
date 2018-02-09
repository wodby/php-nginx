ARG BASE_IMAGE_TAG

FROM wodby/nginx:${BASE_IMAGE_TAG}

COPY templates /etc/gotpl/
COPY init /docker-entrypoint-init.d/