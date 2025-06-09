optimize_dnf() {
    msg header "OTIMIZANDO DNF"
    run_cmd "sudo sed -i 's/^fastestmirror=.*/fastestmirror=True/' /etc/dnf/dnf.conf || echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf"
    run_cmd "sudo sed -i 's/^max_parallel_downloads=.*/max_parallel_downloads=10/' /etc/dnf/dnf.conf || echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf"
    run_cmd "sudo dnf makecache"
    msg success "DNF otimizado"
}