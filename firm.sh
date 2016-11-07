#!/bin/sh
set -eu

. common
CONFIGDESC="$(git describe --abbrev=40 --always --dirty --match '')"

WORKDIR="$1"
REVISION="$2"
DEST="$3"

cd "$WORKDIR"
rm -rf libfirm
rm -rf libfirm_install
mkdir -p libfirm_install
git clone --no-checkout "$REPO_LIBFIRM" libfirm
cd "$WORKDIR/libfirm"
git checkout "$REVISION"
DESC="$(git describe --abbrev=40 --always --dirty --match '')"
make $MAKEFLAGS
make DESTDIR="$WORKDIR/libfirm_install" PREFIX="" install
cd "$WORKDIR/libfirm_install"
git init .
git add -Af .
TAGNAME="build/${DESC}_${CONFIGDESC}"
git commit -m "$TAGNAME from libfirm $DESC ciconfig $CONFIGDESC"
git tag "$TAGNAME"
git remote add dest "$DEST"
git push -f dest "$TAGNAME"
#rm -rf "$WORKDIR/libfirm"
#rm -rf "$WORKDIR/libfirm_install"
