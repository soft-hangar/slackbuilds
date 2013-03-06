
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
# patches for 2.4
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-slapd-conf.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-manpages.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-security-pie.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-sql-linking.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-reentrant-gethostby.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-smbk5pwd-overlay.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-ldaprc-currentdir.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-userconfig-setgid.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-dns-priority.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-syncrepl-unset-tls-options.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-man-sasl-nocanon.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-ai-addrconfig.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-nss-update-list-of-ciphers.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-nss-regex-search-hashed-cacert-dir.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-nss-ignore-certdb-type-prefix.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/openldap-nss-certs-from-certdb-fallback-pem.patch

set +e +o pipefail
