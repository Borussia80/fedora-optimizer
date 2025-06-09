configure_trim() {
    msg header "CONFIGURANDO TRIM PARA SSD"
    run_cmd "sudo systemctl enable --now fstrim.timer"
    msg success "TRIM semanal ativado"
}