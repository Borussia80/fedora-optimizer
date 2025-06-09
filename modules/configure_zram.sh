configure_zram() {
    msg header "CONFIGURANDO ZRAM"
    run_cmd "sudo dnf install -y zram-generator-defaults"
    msg success "ZRAM configurado (ativa-se no próximo boot)"
}