#!/bin/bash
unset UNIX_DEFAULT_MESON_DIRS UNIX_DEFAULT_MESON_CONFIG PAM_UNIQUE Dc_args subdir
subdir=$1

UNIX_DEFAULT_MESON_DIRS=(
'-Dsysconfdir=/etc'
'-Dlocalstatedir=/var'
'-Dsbindir=/sbin'
'-Dbindir=/bin'
'-Ddatadir=share'
'-Dincludedir=include'
'-Dinfodir=share/info'
'-Ddocdir=share/doc'
'-Dlibdir=/lib'
'-Dlibexecdir=/usr/libexec'
'-Dlicensedir=/usr/share/licenses'
'-Dlocaledir=share/locale'
'-Dmandir=share/man'
'-Dlocalstatedir=/var'
'-Dsharedstatedir=/var/lib'
'-Dsysconfdir=/etc'
)

UNIX_DEFAULT_MESON_CONFIG=(
'--auto-features=auto'
'--wrap-mode=nodownload'
'-Db_pie=true'
'--python.bytecompile=0'
# '--python.allow-limited-api=false'
'-Dbackend=ninja'
'-Dbuildtype=plain'
)

PAM_UNIQUE=(
#'-Dlogind=enabled'
#'-Deconf=enabled'
#'-Dselinux=enabled'
#'-Dpwaccess=enabled'
'-Dlogind=disabled'
'-Deconf=disabled'
'-Dselinux=disabled'
'-Dpwaccess=disabled'

'-Dmailspool=/var/mail'
'-Ddb-uniquename='
'-Drandomdev="/dev/urandom"'
# '-Dinstall_umask="022"'
'-Dkernel-overflow-uid=65534'
'-Dmisc-conv-bufsize=4096'
'-Duidmin=1000'
'-Dxauth='
'-Dxml-catalog='
'-Dpam_unix=enabled'

'-Daudit=disabled'
'-Di18n=disabled'
'-Dpam_lastlog=disabled'
'-Dpam_userdb=disabled'
'-Dnis=disabled'
'-Ddocs=disabled'
'-Ddb=auto'

'-Dlckpwdf=true'
'-Dpam-debug=true'
'-Dread-both-confs=true'
'-Dwerror=true'

'-Dpam_unix-try-getspnam=false'
'-Derrorlogs=false'
'-Dexamples=false'
'-Dpamlocking=false'
'-Dstdsplit=false'
'-Dusergroups=false'
'-Dxtests=false'

'-Ddocbook-rng=disabled'
'-Dhtml-stylesheet='
'-Dpdf-stylesheet='
'-Dtxt-stylesheet='
'-Dman-stylesheet="http://docbook.sourceforge.net/release/xsl-ns/current/manpages/profile-docbook.xsl"'
'-Dprefix=/usr'
"-Dc_link_args=${LDFLAGS}"
)
[[ ! -d build ]] && mkdir build
meson setup --wipe --clearcache --reconfigure build/ "${subdir:-pam}" "${UNIX_DEFAULT_MESON_DIRS[@]}" "${UNIX_DEFAULT_MESON_CONFIG[@]}" "${PAM_UNIQUE[@]}"
