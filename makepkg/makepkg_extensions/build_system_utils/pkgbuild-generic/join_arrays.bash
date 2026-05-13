
# Lazy join arrays
  local _all_comp_opts_pre+=("$(printf "%s\n" "${_version_info_comp_opts[@]}")")
  local _all_comp_opts_pre+=("$(printf "%s\n" "${_meson_test_flags[@]}")")
  local _all_comp_opts_pre+=("$(printf "%s\n" "${_std_comp_opts[@]}")")
  local _all_comp_opts_pre+=("$(printf "%s\n" "${_test_comp_opts[@]}")")
  # And strip the last "(problem causing)" index of the array 
    unset '_all_comp_opts_pre[-1]'

function flagify() {
readarray -t _all_comp_opts < <(for item in "${_all_comp_opts_pre[@]}";do sed 's#^#\-D#g' <<< "$item"; done)
}                                            
flagify                                      

function _clean_opts() {
readarray -t _meson_options < <(for item in "${_all_comp_opts[@]}";do sed 's#\-D$##g' <<< "$item"; done)
}
_clean_opts

