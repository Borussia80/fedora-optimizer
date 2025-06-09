configure_kernel_params() {
    msg header "CONFIGURANDO PARÂMETROS DO KERNEL"
    local conf="/etc/sysctl.d/99-optimizer.conf"
    backup_file "$conf"
    cat <<EOF | sudo tee "$conf" >/dev/null
vm.swappiness=10
vm.vfs_cache_pressure=50
fs.inotify.max_user_watches=524288
EOF
    run_cmd "sudo sysctl --system"
    msg success "Parâmetros do kernel aplicados"
}