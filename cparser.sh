#!/bin/bash
set -eu

. common
CONFIG_DESC="$(git rev-parse HEAD)"

WORKDIR="$1"
CPARSER_REVISION="$2"
LIBFIRM_ARTIFACT_TAG="$3"
ARTIFACT_REPO="$4"

cd "$WORKDIR"
rm -rf cparser_install
mkdir -p cparser_install
rm -rf libfirm_install
git clone --branch "${LIBFIRM_ARTIFACT_TAG}" "${ARTIFACT_REPO}" libfirm_install
cd "$WORKDIR/libfirm_install"
LIBFIRM_ARTIFACT_REV="$(git rev-parse HEAD)"
rm -rf cparser
git clone --no-checkout "${CPARSER_REPO}" cparser
cd "$WORKDIR/cparser"
git checkout "${CPARSER_REVISION}"
CPARSER_DESC="$(git rev-parse HEAD)"
FIRMDIR="$WORKDIR/libfirm_install"
cat > config.mak << __EOF__
FIRM_CPPFLAGS=-I${FIRMDIR}/include
FIRM_LIBS=${FIRMDIR}/lib/libfirm.a -lm
LIBFIRM_FILE =
LIBFIRM_FILE_DLL =
COMPILER_INCLUDE_DIR = /lib/cparser/$(VERSION)/include
__EOF__
make $MAKEFLAGS PREFIX=""
make DESTDIR="$WORKDIR/cparser_install" PREFIX="" install
cd "$WORKDIR/cparser_install"
git init .
git add -Af .
TAGNAME="build/cparser/${CPARSER_DESC}_${LIBFIRM_ARTIFACT_REV}_${CONFIG_DESC}"
git commit -m "$TAGNAME from cparser ${CPARSER_DESC} libfirm ${LIBFIRM_ARTIFACT_REV} ciconfig ${CONFIG_DESC}"
git tag "$TAGNAME"
git remote add dest "${ARTIFACT_REPO}"
git push -f dest "$TAGNAME"
#rm -rf "$WORKDIR/libfirm_install"
#rm -rf "$WORKDIR/cparser"
#rm -rf "$WORKDIR/cparser_install"
