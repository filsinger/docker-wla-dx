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

# Create the default working directory for mounting an external folder
RUN mkdir /project
VOLUME /project

# Build and install the wla-dx assembler
RUN git clone -b ${WLA_DX_BRANCH} --single-branch https://github.com/vhelin/wla-dx.git /home/root/wla-dx
WORKDIR /home/root/wla-dx
RUN cmake .
RUN make
RUN make install

# Remove build directories
WORKDIR /home/root
RUN rm -rf /home/root/wla-dx

# Add devloper user
RUN useradd -rm -d /home/developer -s /bin/bash -g root -G sudo -u 1000 developer
USER developer
ENV HOME=/home/developer

# Set the default working directory
WORKDIR /project
