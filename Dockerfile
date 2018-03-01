FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        libmicrohttpd10 git \
        libssl1.0.0 



RUN apt -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev \
    && git clone https://github.com/fireice-uk/xmr-stak.git \
    && mkdir xmr-stak/build \
    && cd xmr-stak/build \
    && cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF \
    && make install




VOLUME /mnt

WORKDIR /mnt


CMD ["/xmr-stak/build/bin/xmr-stak"]



