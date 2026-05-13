#!/bin/bash
function meson-install() {
if [[ -z "${pkgdir}" ]] && [[ ! -d "${pkgdir}" ]]
then
echo '{CRITICAL ERROR} $pkgdir is NOT SET:EXITING'
exit 1 
else
meson install -C "${BUILDDIR}" --no-rebuild --only-changed --destdir="${pkgdir}" 2>&1 | tee log
fi
}
meson-install
