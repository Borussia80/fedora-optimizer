# Funções utilitárias para mensagens, execução e backup

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

msg() {
    local type="$1"; shift
    local message="$*"
    local prefix="" color=""
    case "$type" in
        info)    prefix="[INFO]";    color="${BLUE}";;
        success) prefix="[✓ SUCESSO]"; color="${GREEN}";;
        warning) prefix="[⚠ AVISO]";  color="${YELLOW}";;
        error)   prefix="[✗ ERRO]";    color="${RED}";;
        header)  prefix="[=== $message ===]"; 
                 echo -e "${PURPLE}${prefix}${NC}"; echo "${prefix}" >> "$LOG_FILE"; return;;
         *)       prefix="";            color="${NC}";;
    esac
    echo -e "${color}${prefix}${NC} $message" | tee -a "$LOG_FILE"
}

run_cmd() {
    if [ "${DRY_RUN:-0}" -eq 1 ]; then
        echo -e "${YELLOW}[DRY RUN]${NC} $*"
    else
        eval "$*"
    fi
}

confirm_action() {
    local action="$1"
    echo -e "${YELLOW}Confirmar ação: $action${NC}"
    read -p "Continuar? (s/N): " -r
    echo
    [[ $REPLY =~ ^[Ss]$ ]]
}

backup_file() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local backup_name
        backup_name="$(basename "$file").$(date +%Y%m%d_%H%M%S).bak"
        mkdir -p "$BACKUP_DIR"
        run_cmd "sudo cp '$file' '$BACKUP_DIR/$backup_name'"
        msg info "Backup criado: $backup_name"
    else
        msg warning "Arquivo para backup não encontrado: $file"
    fi
}