
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
zcat ${SB_PATCHDIR}/libtiff-mantypo.patch.gz | patch -p1 -E --backup --verbose
zcat ${SB_PATCHDIR}/libtiff-CVE-2009-2347.patch.gz | patch -p1 -E --backup --verbose
zcat ${SB_PATCHDIR}/libtiff-scanlinesize.patch.gz | patch -p1 -E --backup --verbose

set +e +o pipefail
