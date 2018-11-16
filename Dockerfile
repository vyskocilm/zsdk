# SDK for zeromq based on Alpine Linux

FROM alpine:3.8
RUN apk add --no-cache libuuid gcc g++ make automake libtool autoconf musl-dev zeromq-dev czmq-dev libsodium-dev
