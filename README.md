# Fedora Optimizer Modular - v3.3.3

## Descrição
O **Fedora Optimizer Modular** é um script interativo e modular que automatiza a configuração, otimização e personalização de sistemas Fedora. Ele oferece uma interface intuitiva via menu (`dialog`) e suporte completo a execução por linha de comando, facilitando o uso por iniciantes e usuários avançados.

## Funcionalidades
- Verificações iniciais (root, distribuição, dependências, conectividade)
- Detecção de hardware (GPU, laptop/desktop, núcleos de CPU)
- Configuração de firewall (`firewalld`)
- Instalação de ferramentas essenciais e serviços
- Configuração de repositórios (RPM Fusion, Flathub)
- Suporte multimídia (codecs, fontes, GStreamer, ffmpeg)
- Instalação de emuladores e Steam
- Snapshots via Timeshift e otimização de Btrfs
- Perfis de uso: Gamer, Desenvolvedor, Economia de bateria
- Instalação de pacotes customizados definidos pelo usuário
- Geração de relatórios, ajustes no GNOME e atualizações completas

## Estrutura Modular
Os módulos estão organizados no diretório `modules/`, com um script principal (`fedora_optimizer.sh`) que orquestra sua execução:

```
.
├── fedora_optimizer.sh
└── modules
    ├── core_utils.sh
    ├── configure_firewalld.sh
    ├── optimize_dnf.sh
    ├── ... (demais módulos)
```

Cada módulo define funções específicas como `configure_firewalld`, `install_flatpak_apps`, etc., e segue um padrão de logging e execução controlada por `run_cmd` e `msg`.

## Requisitos
- Sistema Fedora (testado nas versões 38, 39, 40, 41, 42)
- Permissão para uso do `sudo`
- Conexão com a internet

## Instalação
```bash
git clone https://github.com/seuusuario/fedora-optimizer.git
cd fedora-optimizer
chmod +x fedora_optimizer.sh
./fedora_optimizer.sh
```

## Modos de Execução

### Interativo (menu com `dialog`)
```bash
./fedora_optimizer.sh
```

### Linha de comando
```bash
./fedora_optimizer.sh --firewall --essentials --flatpak --update
```

### Perfis de otimização
```bash
./fedora_optimizer.sh --profile gamer
```

## Argumentos Disponíveis
- `--dnf`, `--firewall`, `--io`, `--trim`, `--zram`, `--kernel`
- `--essentials`, `--multimedia`, `--hardware`, `--gpu-drivers`, `--laptop`
- `--repos`, `--ssh`, `--dev`, `--cleanup`, `--report`, `--update`
- `--gnome`, `--flatpak`, `--apps`, `--tuned`, `--snapshot`, `--btrfs`
- `--custom`, `--sample`, `--steam`, `--profile <nome>`
- `--all`, `--help`

## Observações
- As otimizações para `zram` e `btrfs` requerem reinicialização para efeito total.
- ROMs utilizadas em emuladores devem ter respaldo legal.

## Licença
MIT License. Sinta-se à vontade para modificar e redistribuir com os devidos créditos.

---

Desenvolvido por Roberto Milet com foco em desempenho, segurança e controle no Fedora Linux.