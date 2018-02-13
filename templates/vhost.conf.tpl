upstream php {
    server {{ getenv "NGINX_BACKEND_HOST" "php" }}:9000;
}

map $http_x_forwarded_proto $fastcgi_https {
    default $https;
    http '';
    https on;
}

server {
    server_name  {{ getenv "NGINX_SERVER_NAME" "default" }};
    listen       80 default_server{{ if getenv "NGINX_HTTP2" }} http2{{ end }};

    root {{ getenv "NGINX_SERVER_ROOT" "/var/www/html/" }};
    index {{ getenv "NGINX_INDEX_FILE" "index.php" }};

    include healthz.conf;
    include fastcgi.conf;

    location ~* ^/.well-known/ {
        allow all;
    }

    location = /favicon.ico {
        try_files $uri =204;
        log_not_found off;
        access_log off;
    }

    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }

    location ~ /\. {
        deny all;
    }

    if (!-d $request_filename) {
        rewrite ^/(.+)/$ /$1 permanent;
    }

    location / {
        try_files $uri /{{ getenv "NGINX_INDEX_FILE" "index.php" }}?$args;
    }

    location ~ [^/]\.php(/|$) {
        fastcgi_split_path_info ^(.+?\.php)(/.*)$;
        fastcgi_pass php;
        track_uploads uploads 60s;
    }
}
