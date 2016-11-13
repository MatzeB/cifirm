#!/bin/bash
set -eux

# Sanity check that all required directories exist
test -d libfirm-install
test -d cparser
test -d cparser-install

rm -rf cparser/build
rm -f cparser/config.mak
FIRMDIR=$(pwd)/libfirm-install
cat > cparser/config.mak << __EOF__
FIRM_CPPFLAGS=-I${FIRMDIR}/include
FIRM_LIBS=${FIRMDIR}/lib/libfirm.a -lm
LIBFIRM_FILE =
LIBFIRM_FILE_DLL =
COMPILER_INCLUDE_DIR = /lib/cparser/\$(VERSION)/include
PREFIX = ""
__EOF__
make -C cparser
make -C cparser DESTDIR="$(pwd)/cparser-install" install
