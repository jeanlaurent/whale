FROM nginxinc/nginx-unprivileged:1.27.1-alpine@sha256:210cfc5bd0cf396a75962e906f7aa7a23b826855125940ce16abbb17fd018f74
USER root
RUN apk update && \
    apk add --no-cache openssl && \
    apk add --no-cache libexpat && \
    rm -rf /var/cache/apk/*
USER 101
COPY index.html /usr/share/nginx/html/
EXPOSE 8080