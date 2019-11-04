# Small zeromq container for https://github.com/zeromq/czmq/issues/2007

FROM alpine:3.8
RUN apk add --no-cache libuuid gcc g++ make automake libtool autoconf musl-dev zeromq-dev libsodium-dev git gdb
WORKDIR /app
RUN git clone https://github.com/zeromq/czmq.git
WORKDIR czmq
RUN ./autogen.sh && ./configure && make
