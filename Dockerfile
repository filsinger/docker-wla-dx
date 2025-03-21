FROM debian:bookworm-slim

ARG WLA_DX_BRANCH="master"

RUN apt-get update && apt-get install -y \
    ca-certificates \
    gcc \
    g++ \
    nasm \
    make \
    git \
    unzip \
    cmake \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/root

RUN git clone -b ${WLA_DX_BRANCH} --single-branch https://github.com/vhelin/wla-dx.git
WORKDIR /home/root/wla-dx
RUN cmake .
RUN make
RUN make install
WORKDIR /home/root
RUN rm -rf /home/root/wla-dx
