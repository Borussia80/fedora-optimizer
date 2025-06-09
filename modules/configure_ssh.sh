configure_ssh() {
    msg header "CONFIGURANDO SSH E FAIL2BAN"
    run_cmd "sudo systemctl enable --now sshd"
    run_cmd "sudo dnf install -y fail2ban"
    run_cmd "sudo systemctl enable --now fail2ban"
    msg success "SSH e Fail2ban configurados"
}