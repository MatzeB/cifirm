#!/bin/bash
set -eux

. common
CONFIG_REV="$(git rev-parse HEAD)"

WORKDIR="$1"
REVISION="$2"
ARTIFACT_REPO="$3"

cd "$WORKDIR"
rm -rf libfirm
rm -rf libfirm_install
mkdir -p libfirm_install
git clone --no-checkout "$LIBFIRM_REPO" libfirm
cd "$WORKDIR/libfirm"
git checkout "$REVISION"
LIBFIRM_REV="$(git rev-parse HEAD)"
make $MAKEFLAGS
make DESTDIR="$WORKDIR/libfirm_install" PREFIX="" install
cd "$WORKDIR/libfirm_install"
git init .
git add -Af .
TAGNAME="build/libfirm/${LIBFIRM_REV}_${CONFIG_REV}"
git commit -m "$TAGNAME from libfirm ${LIBFIRM_REV} ciconfig ${CONFIG_REV}"
git tag "$TAGNAME"
git remote add dest "${ARTIFACT_REPO}"
git push -f dest "$TAGNAME"
#rm -rf "$WORKDIR/libfirm"
#rm -rf "$WORKDIR/libfirm_install"
