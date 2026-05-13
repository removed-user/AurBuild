#!/bin/bash
mkstub (){ 
local TO_STUB="$@"
mkdir -p /var/cache/AurBuild/Repos/stubs/"${TO_STUB}"

cat /usr/share/makepkg-template/stub | sed "s#pkgname=PKGNAME#pkgname="${TO_STUB}"#g"  | tee /var/cache/AurBuild/Repos/stubs/"${TO_STUB}"/PKGBUILD
(cd /var/cache/AurBuild/Repos/stubs/"${TO_STUB}" && makepkg -fs --skipchecksums --skippgpcheck )
repoctl update

}

