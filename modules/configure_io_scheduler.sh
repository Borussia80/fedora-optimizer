configure_io_scheduler() {
    msg header "CONFIGURANDO ESCALONADOR I/O"
    local scheduler="mq-deadline"
    for dev in /sys/block/sd*/queue/scheduler; do
        if [[ -w "$dev" ]]; then
            echo $scheduler | sudo tee "$dev"
            msg info "Escalonador '$scheduler' aplicado a $(basename $(dirname $(dirname "$dev")))"
        fi
    done
    msg success "Escalonador I/O configurado"
}