echo "Restoring $1.conf file" &&
    cp $1.conf /etc/pve/nodes/$HOSTNAME/lxc/$1.conf &&
    pct reboot $1 &&
    pct mount $1 &&
    echo "Fixing rootfs ownership" &&
    chown -R 1000:1000 /var/lib/lxc/$1/rootfs &&
    pct unmount $1 &&
    pct reboot $1 &&
    echo "Rebooted"
