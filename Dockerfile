FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates build-essential libtool autoconf automake git flex bison && \
    apt-get clean

ADD build.sh /

WORKDIR /build

VOLUME [ "/dist" ]

ENTRYPOINT [ "/build.sh" ]
