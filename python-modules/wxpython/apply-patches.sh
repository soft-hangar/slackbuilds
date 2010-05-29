
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/wxpython-2.8.9-wxversion-scripts.patch
# http://trac.wxwidgets.org/ticket/10703
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/wxPython-2.8.9.2-treelist.patch
# backport to wxGTK 2.8.10 API
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/wxPython-2.8.10-backport.patch

set +e +o pipefail
