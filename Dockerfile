FROM node:current-alpine@sha256:01d7eb1371c06c3b3c7cd31ab6a7c7bd00a03f39e8a6bfe4c1ed9e3dd02b3dc7
RUN apk update && apk add --no-cache \
    openssl=3.3.4-r0 \
    libexpat=2.7.0-r0 \
    && rm -rf /var/cache/apk/*
COPY package*.json ./
COPY static/ static/
COPY index.js index.js
EXPOSE 3000
RUN npm ci --only=production
CMD ["node", "index.js"]