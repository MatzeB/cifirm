#!/bin/bash
. common
LIBFIRM_REV="$(git --git-dir ${LIBFIRM_REPO} rev-parse HEAD)"
echo "Building $LIBFIRM_REV"
docker run -it libfirm/ciworker:latest cirun libfirm.sh /root/workspace ${LIBFIRM_REV} /root/artifacts
