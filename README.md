# 🚀 Kit Pós-Formatação - Instalador de Programas

> **Instalador automatizado de programas essenciais para Windows via interface gráfica**

[![Windows](https://img.shields.io/badge/Windows-10%2F11-blue?logo=windows)](https://www.microsoft.com/windows)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell)](https://docs.microsoft.com/powershell/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

## 📖 Sobre o Projeto

Este projeto foi criado para facilitar a reinstalação de programas essenciais após formatar o Windows. Com uma interface gráfica intuitiva, você pode selecionar e instalar dezenas de programas populares com apenas alguns cliques.

### ✨ Características

- 🎨 **Interface Gráfica** - Checkboxes para seleção fácil de programas
- 📜 **Scroll Automático** - Veja todos os programas disponíveis
- 🔄 **Barra de Progresso** - Acompanhe a instalação em tempo real
- ⚡ **Instalação Silenciosa** - Sem interrupções ou pop-ups
- 📦 **60+ Programas** - Organizados por categorias

## 🎯 Programas Incluídos

### 🌐 Navegadores
- Google Chrome
- Brave Browser
- Mozilla Firefox
- Opera GX

### 💬 Comunicação
- Discord
- WhatsApp Desktop
- Telegram

### 🎮 Jogos/Launchers
- Steam
- Epic Games Launcher
- Riot Client (Valorant/LOL)
- EA App
- Battle.net
- Ubisoft Connect
- GOG Galaxy

### 🛠️ Utilitários Essenciais
- 7-Zip
- VLC Media Player
- qBittorrent
- ShareX (Screenshot)
- PowerToys
- Everything (Busca de arquivos)

### 📊 Performance/Monitoring
- MSI Afterburner
- HWiNFO64
- CPU-Z
- GPU-Z
- CrystalDiskInfo

### 🎨 Criação de Conteúdo
- OBS Studio
- Audacity
- GIMP

### 💻 Programação
- Visual Studio Code
- Git
- Notepad++
- Python 3

### 🎁 Extras
- TreeSize Free
- Revo Uninstaller
- Spotify
- Malwarebytes

### 📦 Runtime/Dependências
- DirectX Runtime
- Visual C++ 2015-2022

### 🛠️ Otimização/Tweaking
- Process Lasso
- AutoRuns (Sysinternals)
- WizTree (Análise de Disco)
- BleachBit (Limpeza)
- Open Hardware Monitor
- PrivateZilla (Privacidade)
- ShutUp10++ (Privacidade)

## 📋 Pré-requisitos

- Windows 10 ou 11
- PowerShell 5.1 ou superior
- Winget (Windows Package Manager) - já vem instalado no Windows 11

## 🚀 Como Usar

### Método 1: Download Direto

1. Baixe o arquivo `instalador.ps1`
2. Clique com o botão direito no arquivo
3. Selecione **"Executar com PowerShell"**
4. Marque os programas desejados
5. Clique em **"BAIXAR E INSTALAR"**

### Método 2: Via PowerShell Admin

```powershell
# Baixar o script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MADZIN01/windows-post-format-kit/main/instalador.ps1" -OutFile "instalador.ps1"

# Executar
powershell -ExecutionPolicy Bypass -File .\instalador.ps1
```

### Método 3: Clone o Repositório

```bash
git clone https://github.com/MADZIN01/windows-post-format-kit.git
cd windows-post-format-kit
powershell -ExecutionPolicy Bypass -File .\instalador.ps1
```

## ⚠️ Solução de Problemas

### Erro: "Execução de scripts desabilitada"

Execute no PowerShell como Administrador:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

### Erro: Winget não encontrado

O Winget vem instalado por padrão no Windows 11. No Windows 10, instale via Microsoft Store:
- Procure por **"App Installer"** na Microsoft Store

### Programa não instalou

Alguns programas podem requerer interação manual. Verifique se há janelas abertas em segundo plano.

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se livre para:

1. Fazer um Fork do projeto
2. Criar uma Branch (`git checkout -b feature/NovoPrograma`)
3. Commit suas mudanças (`git commit -m 'Adiciona novo programa'`)
4. Push para a Branch (`git push origin feature/NovoPrograma`)
5. Abrir um Pull Request

### Adicionando Novos Programas

Para adicionar um novo programa, edite o arquivo `instalador.ps1` e adicione na categoria apropriada:

```powershell
@{Nome="Nome do Programa"; ID="Winget.Package.ID"}
```

Para encontrar o ID do Winget:
```powershell
winget search "nome do programa"
```

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 💡 Dicas

- **Salve em um pendrive**: Tenha sempre o script disponível após formatar
- **Execute regularmente**: Use para manter seus programas atualizados
- **Customize**: Edite o script para adicionar seus programas favoritos

## 🙏 Créditos

- Desenvolvido com ❤️ para facilitar a vida após formatações
- Utiliza [Winget](https://github.com/microsoft/winget-cli) - Windows Package Manager

## 📞 Suporte

Se encontrar algum problema ou tiver sugestões:
- Abra uma [Issue](https://github.com/MADZIN01/windows-post-format-kit/issues)
- Entre em contato via [Discussions](https://github.com/MADZIN01/windows-post-format-kit/discussions)

---

⭐ Se este projeto te ajudou, considere dar uma estrela!

**Made with** ☕ **and** 💻
