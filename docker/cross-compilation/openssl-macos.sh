#!/bin/bash

brew install aarch64-elf-gcc

# Set the target and compiler
TARGET=$1
CROSS_COMPILE=$2

# Download and extract OpenSSL
wget -O https://www.openssl.org/source/openssl-1.0.2p.tar.gz
tar -xzf openssl-1.0.2p.tar.gz
cd openssl-1.0.2p

# Configure and build OpenSSL
./Configure $TARGET no-shared no-dso --prefix=/openssl --openssldir=/openssl
make -j$(sysctl -n hw.ncpu)
make install

# Clean up
cd ..
rm -rf openssl-1.0.2p openssl-1.0.2p.tar.gz