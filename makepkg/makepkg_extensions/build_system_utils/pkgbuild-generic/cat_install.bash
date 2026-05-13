    function _Handle_Core_Defaults() {
        function _CreATe_arch.conf() {
        install -D -m0644 <(cat << EOF  
        ## This is just an example config file.
        ## Please edit the paths and kernel parameters according to your system.
        
        title   Arch Linux
        linux   /vmlinuz-linux
        initrd  /initramfs-linux.img
        options root=PARTUUID=XXXX rootfstype=XXXX 
EOF
        )  "${pkgdir}"/usr/share/systemd/bootctl/arch.conf
        }
