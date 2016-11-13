#!/bin/bash
. common
LIBFIRM_REV="$(git --git-dir ${LIBFIRM_REPO} rev-parse master)"
CPARSER_REV="$(git --git-dir ${CPARSER_REPO} rev-parse master)"
CONFIG_REV="$(git rev-parse HEAD)"
ARTIFACT_TAG="build/libfirm/${LIBFIRM_REV}_${CONFIG_REV}"
docker run -it libfirm/ciworker:latest cirun cparser.sh /root/workspace ${CPARSER_REV} ${ARTIFACT_TAG} /root/artifacts
