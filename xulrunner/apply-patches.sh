
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
# build patches
zcat ${SB_PATCHDIR}/${NAME}-version.patch.gz | sed -e "s/__RPM_VERSION_INTERNAL__/${GECKO_DIR_VER}/" | patch -p1 -E --backup --verbose
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-build.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}-2.0-chromium-types.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/xulrunner-10.0-gcc47.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-linux3.patch

# Fedora specific patches
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-193-pkgconfig.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/wmclass.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/crashreporter-remove-static.patch

# Upstream patches
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-696393.patch
# https://bugzilla.mozilla.org/show_bug.cgi?id=707993
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/xulrunner-8.0-fix-maemo-checks-in-npapi.patch
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-682832-proxy.patch
# cherry-picked from 13afcd4c097c
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/xulrunner-9.0-secondary-build-fix.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-706724.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-file.patch
# Needed to detect/use libvpx-1.0.0
# https://bugzilla.mozilla.org/show_bug.cgi?id=722127
patch -p2 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-722127.patch

# OpenSuse kde integration support
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mozilla-nongnome-proxies.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/firefox-browser-css.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/firefox-cross-desktop.patch
if [ "${SB_KDE}" = "YES" ] ;then
  install -m 644 ${SB_PATCHDIR}/kde.js browser/app/profile/kde.js
  patch -p1 -E --backup -z .moz-kde --verbose -i ${SB_PATCHDIR}/mozilla-kde.patch
  patch -p1 -E --backup -z .fx-kde --verbose -i ${SB_PATCHDIR}/firefox-kde.patch
fi

set +e +o pipefail
