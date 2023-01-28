FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates build-essential make libtool autoconf automake git flex bison python3 && \
    apt-get clean

ADD build.sh /

WORKDIR /build

VOLUME [ "/dist" ]

ENTRYPOINT [ "/build.sh" ]
