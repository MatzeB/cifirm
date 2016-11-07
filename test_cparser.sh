. common
LIBFIRM_REV="$(git --git-dir ${LIBFIRM_REPO} rev-parse master)"
CPARSER_REV="$(git --git-dir ${CPARSER_REPO} rev-parse master)"
CONFIG_REV="$(git rev-parse HEAD)"
ARTIFACT_TAG="build/libfirm/${LIBFIRM_REV}_${CONFIG_REV}"
./cparser.sh /tmp/testbuild ${CPARSER_REV} ${ARTIFACT_TAG} /tmp/artifacts
