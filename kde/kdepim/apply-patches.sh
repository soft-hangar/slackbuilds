
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup -z .install-headers --verbose -i ${SB_PATCHDIR}/${NAME}-4.9.95-install_headers.patch

# Trunk Patches

# upstream patches

set +e +o pipefail
