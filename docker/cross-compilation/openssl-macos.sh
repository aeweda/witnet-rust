#!/bin/bash

brew install aarch64-elf-gcc binutils

set -ex

main() {
    local version=1.0.2p
    local os=$1 \
          triple=$2

    td=$(mktemp -d)

    pushd $td
    wget https://www.openssl.org/source/openssl-$version.tar.gz
    tar --strip-components=1 -xzvf openssl-$version.tar.gz
    AR=${triple}ar CC=${triple}gcc ./Configure \
      --prefix=/openssl \
      no-dso \
      $os \
      -fPIC \
      ${@:3}
    nice make -j$(sysctl -n hw.ncpu) CC=aarch64-elf-gcc AS=aarch64-elf-as
    make install

    popd

    rm -rf $td
    rm $0
}

main "${@}"
