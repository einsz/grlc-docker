FROM alpine:3.8 AS build_step

RUN apk --update add git openssh libevent-dev boost-dev autoconf automake libtool g++ openssl-dev make

WORKDIR /root/Garlicoin
RUN git clone --depth 1 https://github.com/GarlicoinOrg/Garlicoin.git .
COPY install-berkeleydb-4.8.sh /root/Garlicoin/
RUN chmod +x ./install-berkeleydb-4.8.sh && ./install-berkeleydb-4.8.sh
RUN ./autogen.sh
RUN ./configure --without-gui --disable-tests --disable-bench LDFLAGS="-L/root/Garlicoin/db4/lib/" CPPFLAGS="-I/root/Garlicoin/db4/include/"
RUN make


FROM alpine:3.8

VOLUME ["/root/.garlicoin"]
#EXPOSE 42068 42069 42070 42075

RUN apk --update add libevent boost-dev openssl
RUN rm -rf /var/lib/apt/lists/*
RUN rm /var/cache/apk/*

RUN mkdir -p /root/bin
ENV PATH="/root/bin:$PATH"
COPY --from=build_step /root/Garlicoin/src/garlicoin* /root/bin/
COPY entrypoint.sh /root/bin
RUN chmod +x /root/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]