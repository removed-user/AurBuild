t=(
  arch-meson libinput  build \
    -D udev-dir="/usr/lib/udev" \
    -D libwacom="false" \
    -D autoload-plugins="false" \
    -D coverity="false" \
    -D debug-gui="false" \
    -D install-tests="false" \
    -D internal-event-debugging="false" \
    -D lua-plugins="auto" \
    -D mtdev="false" \
    -D tests="false" \
    -D zshcompletiondir="/etc/completions.d/zsh" \
    -D documentation="false" \
    -D libwacom="false"  # -Db_lto=true -Db_lto_mode=thin -Dc_std=gnu2y -Dcpp_std=gnu++26
)
echo "${t[@]}"
