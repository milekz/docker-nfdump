FROM alpine

RUN apk update &&  apk add git make pkgconfig bison flex libtool autoconf automake g++ libzip-dev bzip2-dev curl-dev && \
    git clone https://github.com/phaag/nfdump.git && \
    cd nfdump && \
    ./autogen.sh  && \
    ./configure --enable-influxdb --enable-nsel --enable-sflow && \
    make && \ 
    make install && \
    make clean && \
    apk del git make pkgconfig g++ make autoconf automake && rm -rf /nfdump && \
    nfcapd -V
