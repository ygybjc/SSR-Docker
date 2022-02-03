FROM alpine

ARG SSR_URL=https://github.com/ygybjc/SSR-Docker/raw/master/manyuser.zip

RUN set -ex && \
    apk add --no-cache libsodium py-pip && \
    pip --no-cache-dir install $SSR_URL

WORKDIR /app

COPY etc/config.json .

CMD ["ssserver", "-c", "config.json"]
