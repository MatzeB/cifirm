. common
LIBFIRM_REV="$(git --git-dir ${LIBFIRM_REPO} rev-parse master)"
./libfirm.sh /tmp/testbuild ${LIBFIRM_REV} /tmp/artifacts
