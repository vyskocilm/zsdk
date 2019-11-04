# SDK for zeromq

It is based in alpine Linux, so have small footprint and intended for producing STATICALLY linked programs based on czmq.

## How to use

Note: it's a toy atm, will be enhanced to enable building the real programs

```sh
cat <<EOF > t.c
#include <czmq.h>

int main () {
    zsys_init ();
    zsys_info ("Hello czmq");
}
EOF
docker run --rm -v `pwd`:/tmp zsdk:alpine-3.8 g++ -g -static /tmp/t.c -lczmq -lzmq -lsodium -luuid -o /tmp/t
ldd ./t
    statically linked
./t
I: 18-11-16 09:47:40 Hello czmq
```

## How to build

```
docker build -t zsdk:alpine-3.8 .
docker tag zsdk:alpine-3.8 vyskocilm/zsdk:alpine-3.8
docker push vyskocilm/zsdk:alpine-3.8
```

## Issue 2007

In order to debug https://github.com/zeromq/czmq/issues/2007 run

```
docker run --ulimit core=99999999999:99999999999 --cap-add=SYS_PTRACE vyskocilm/zsdk:alpine-3.8 make check
```

If selftest fails, please sent the generated `core` file (will be inside
        container) back. The name of core file will be affected by value at
`/proc/sys/kernel/core_pattern`


