
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup --verbose -d gfx/cairo/cairo -i ${SB_PATCHDIR}/01_fix_slowness.patch
# build patches
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-build.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/xulrunner-install-dir.patch
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}-2.0-chromium-types.patch
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/xulrunner-15.0-gcc47.patch
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/rhbz-304121.patch

# Fedora specific patches
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-193-pkgconfig.patch
[ "${ARCH}" = "x86_64" ] || patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/rhbz-928353.patch

# OpenSUSE
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/toolkit-download-folder.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-nongnome-proxies.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-gstreamer-760140.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-gstreamer-1.patch

# Upstream patches
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-791626.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-239254.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-844883.patch

# OpenSuse kde integration support
if [ "${SB_KDE}" = "YES" ] ;then
  patch -p1 -E --backup -z .moz-kde --verbose -i ${SB_PATCHDIR}/mozilla-kde.patch
fi

set +e +o pipefail
