
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup -z .multilib --verbose -i ${SB_PATCHDIR}/libpcap-multilib.patch
zcat ${SB_PATCHDIR}/${NAME}-man.patch.gz | patch -p1 -E --backup --verbose
zcat ${SB_PATCHDIR}/${NAME}-0.8.3-ppp.patch.gz | patch -p0 -E --backup --verbose

set +e +o pipefail
