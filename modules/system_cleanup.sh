system_cleanup() {
    msg header "LIMPANDO O SISTEMA"
    run_cmd "sudo dnf autoremove -y"
    run_cmd "sudo dnf clean all"
    run_cmd "rm -rf ~/.cache/*"
    msg success "Sistema limpo com sucesso"
}