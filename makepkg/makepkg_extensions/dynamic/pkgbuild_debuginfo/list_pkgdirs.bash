if __pkgbuild_defines_split_pkgs="true"
  then
[[ ! -d "${makepkg_extensions_log_dir}" ]] && mkdir -p "${makepkg_extensions_log_dir}"
[[ -f "${makepkg_extensions_log_dir}"/pkgdirs.log ]] && rm "${makepkg_extensions_log_dir}"/pkgdirs.log
for _each_package_name in "${pkgnames}"
do
"${_each_package_name}"_pkgdir=$(cmd to get pkgdir)
printf 'Package\='"${_each_package_name}"'\n''Packages pkgdir\='"${_each_package_name_pkgdir}" 2>&1 | tee -a
"${makepkg_extensions_log_dir}"/pkgdirs.log

done
fi
