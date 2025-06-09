install_gpu_drivers() {
    msg header "INSTALANDO DRIVERS DE GPU"
    case "$DETECTED_GPU" in
        nvidia)
            run_cmd "sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda"
            msg success "Driver NVIDIA instalado";;
        amd)
            run_cmd "sudo dnf install -y mesa-dri-drivers mesa-vulkan-drivers"
            msg success "Drivers AMD aplicados";;
        intel)
            run_cmd "sudo dnf install -y intel-media-driver mesa-vulkan-intel"
            msg success "Drivers Intel aplicados";;
        *)
            msg warning "GPU não identificada. Instalação de drivers pulada.";;
    esac
}