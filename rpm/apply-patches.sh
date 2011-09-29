
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
zcat ${SB_PATCHDIR}/rpm-4.5.90-pkgconfig-path.patch.gz | patch -p1 -E --backup --verbose
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/rpm-4.8.0-no-man-dirs.patch
# gnupg2 comes installed by default, avoid need to drag in gnupg too
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/rpm-4.8.1-use-gpg2.patch

# Patches already in upstream
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/rpm-4.9.1-rpmdb-signals.patch

# These are not yet upstream
zcat ${SB_PATCHDIR}/rpm-4.6.0-niagara.patch.gz | patch -p1 -E --backup --verbose
zcat ${SB_PATCHDIR}/rpm-4.7.1-geode-i686.patch.gz | patch -p1 -E --backup --verbose
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/rpm-4.9.1.1-ld-flags.patch

set +e +o pipefail
