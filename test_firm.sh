. common
LIBFIRM_REV="$(git --git-dir ${LIBFIRM_REPO} rev-parse master)"
./firm.sh /tmp/testbuild ${LIBFIRM_REV} /tmp/artifacts
