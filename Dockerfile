FROM nginxinc/nginx-unprivileged:1.27.1-alpine@sha256:c149247b2e5997ce60f337bcb19f61c0c09b906224e6f1683be64248c814d7e1
USER root
RUN apk update && \
    apk add --no-cache --upgrade openssl libexpat && \
    rm -rf /var/cache/apk/*
USER nginx
COPY static /usr/share/nginx/html
