FROM alpine:3.4

RUN apk update && apk add libcurl curl-dev openssl-dev autoconf build-base automake libtool

ADD . /osslsigncode
WORKDIR /osslsigncode

RUN ./autogen.sh && ./configure && make && make install && make clean

CMD [ "/usr/local/bin/osslsigncode" ]
