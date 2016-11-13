#!/bin/bash
set -eux

test -d libfirm-install || echo "Expect libfirm-install dir"

rm -rf libfirm/build
make -C libfirm
make -C libfirm PREFIX="" DESTDIR=$(pwd)/libfirm-install install
