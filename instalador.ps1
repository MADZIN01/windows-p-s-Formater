# ========================================
#  KIT POS-FORMATACAO - INSTALADOR GUI
#  Interface Grafica com Checkboxes
# ========================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Verifica se esta rodando como Admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    [System.Windows.Forms.MessageBox]::Show("Execute como Administrador!", "Erro", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit
}

# ========================================
#  LISTA DE PROGRAMAS (Winget IDs)
# ========================================
$programas = @{
    "NAVEGADORES" = @(
        @{Nome="Google Chrome"; ID="Google.Chrome"},
        @{Nome="Brave Browser"; ID="Brave.Brave"},
        @{Nome="Mozilla Firefox"; ID="Mozilla.Firefox"},
        @{Nome="Opera GX"; ID="Opera.OperaGX"}
    )
    "COMUNICACAO" = @(
        @{Nome="Discord"; ID="Discord.Discord"},
        @{Nome="WhatsApp Desktop"; ID="WhatsApp.WhatsApp"},
        @{Nome="Telegram"; ID="Telegram.TelegramDesktop"}
    )
    "JOGOS/LAUNCHERS" = @(
        @{Nome="Steam"; ID="Valve.Steam"},
        @{Nome="Epic Games Launcher"; ID="EpicGames.EpicGamesLauncher"},
        @{Nome="Riot Client (Valorant/LOL)"; ID="RiotGames.RiotClient"},
        @{Nome="EA App"; ID="ElectronicArts.EADesktop"},
        @{Nome="Battle.net"; ID="Blizzard.BattleNet"},
        @{Nome="Ubisoft Connect"; ID="Ubisoft.Connect"},
        @{Nome="GOG Galaxy"; ID="GOG.Galaxy"}
    )
    "UTILITARIOS ESSENCIAIS" = @(
        @{Nome="7-Zip"; ID="7zip.7zip"},
        @{Nome="VLC Media Player"; ID="VideoLAN.VLC"},
        @{Nome="qBittorrent"; ID="qBittorrent.qBittorrent"},
        @{Nome="ShareX (Screenshot)"; ID="ShareX.ShareX"},
        @{Nome="PowerToys"; ID="Microsoft.PowerToys"},
        @{Nome="Everything (Busca arquivos)"; ID="voidtools.Everything"}
    )
    "PERFORMANCE/MONITORING" = @(
        @{Nome="MSI Afterburner"; ID="Guru3D.Afterburner"},
        @{Nome="HWiNFO64"; ID="REALiX.HWiNFO"},
        @{Nome="CPU-Z"; ID="CPUID.CPU-Z"},
        @{Nome="GPU-Z"; ID="TechPowerUp.GPU-Z"},
        @{Nome="CrystalDiskInfo"; ID="CrystalDewWorld.CrystalDiskInfo"}
    )
    "CRIACAO DE CONTEUDO" = @(
        @{Nome="OBS Studio"; ID="OBSProject.OBSStudio"},
        @{Nome="Audacity"; ID="Audacity.Audacity"},
        @{Nome="GIMP"; ID="GIMP.GIMP"}
    )
    "PROGRAMACAO" = @(
        @{Nome="Visual Studio Code"; ID="Microsoft.VisualStudioCode"},
        @{Nome="Git"; ID="Git.Git"},
        @{Nome="Notepad++"; ID="Notepad++.Notepad++"},
        @{Nome="Python 3"; ID="Python.Python.3.12"}
    )
    "EXTRAS" = @(
        @{Nome="TreeSize Free"; ID="JAMSoftware.TreeSize.Free"},
        @{Nome="Revo Uninstaller"; ID="RevoUninstaller.RevoUninstaller"},
        @{Nome="Spotify"; ID="Spotify.Spotify"},
        @{Nome="Malwarebytes"; ID="Malwarebytes.Malwarebytes"}
    )
    "RUNTIME/DEPENDENCIAS" = @(
        @{Nome="DirectX Runtime"; ID="Microsoft.DirectX"},
        @{Nome="Visual C++ 2015-2022"; ID="Microsoft.VCRedist.2015+.x64"}
    )
    "OTIMIZACAO/TWEAKING" = @(
        @{Nome="Process Lasso"; ID="BitSum.ProcessLasso"},
        @{Nome="AutoRuns (Sysinternals)"; ID="Microsoft.Sysinternals.Autoruns"},
        @{Nome="WizTree (Analise de Disco)"; ID="AntibodySoftware.WizTree"},
        @{Nome="BleachBit (Limpeza)"; ID="BleachBit.BleachBit"},
        @{Nome="Open Hardware Monitor"; ID="OpenHardwareMonitor.OpenHardwareMonitor"},
        @{Nome="PrivateZilla (Privacidade)"; ID="Builtbybel.PrivateZilla"},
        @{Nome="ShutUp10++ (Privacidade)"; ID="O-O-Software.ShutUp10"}
    )
}

# ========================================
#  CRIANDO INTERFACE GRAFICA
# ========================================
$form = New-Object System.Windows.Forms.Form
$form.Text = "KIT POS-FORMATACAO - Instalador de Programas"
$form.Size = New-Object System.Drawing.Size(700, 600)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# Titulo
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(20, 10)
$label.Size = New-Object System.Drawing.Size(650, 30)
$label.Text = "Selecione os programas que deseja instalar:"
$label.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($label)

# Panel com scroll
$panel = New-Object System.Windows.Forms.Panel
$panel.Location = New-Object System.Drawing.Point(20, 50)
$panel.Size = New-Object System.Drawing.Size(640, 420)
$panel.AutoScroll = $true
$panel.BorderStyle = "FixedSingle"
$form.Controls.Add($panel)

# Criar checkboxes
$yPos = 10
$checkboxes = @{}

foreach ($categoria in $programas.Keys | Sort-Object) {
    # Label da categoria
    $catLabel = New-Object System.Windows.Forms.Label
    $catLabel.Location = New-Object System.Drawing.Point(10, $yPos)
    $catLabel.Size = New-Object System.Drawing.Size(600, 25)
    $catLabel.Text = "$categoria"
    $catLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
    $catLabel.ForeColor = [System.Drawing.Color]::DarkBlue
    $panel.Controls.Add($catLabel)
    $yPos += 30
    
    # Checkboxes dos programas
    foreach ($prog in $programas[$categoria]) {
        $checkbox = New-Object System.Windows.Forms.CheckBox
        $checkbox.Location = New-Object System.Drawing.Point(30, $yPos)
        $checkbox.Size = New-Object System.Drawing.Size(580, 20)
        $checkbox.Text = $prog.Nome
        $checkbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
        $checkboxes[$prog.ID] = $checkbox
        $panel.Controls.Add($checkbox)
        $yPos += 25
    }
    
    $yPos += 10
}

# Botao MARCAR TODOS
$btnMarcarTodos = New-Object System.Windows.Forms.Button
$btnMarcarTodos.Location = New-Object System.Drawing.Point(20, 480)
$btnMarcarTodos.Size = New-Object System.Drawing.Size(150, 35)
$btnMarcarTodos.Text = "Marcar Todos"
$btnMarcarTodos.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$btnMarcarTodos.Add_Click({
    foreach ($cb in $checkboxes.Values) {
        $cb.Checked = $true
    }
})
$form.Controls.Add($btnMarcarTodos)

# Botao DESMARCAR TODOS
$btnDesmarcarTodos = New-Object System.Windows.Forms.Button
$btnDesmarcarTodos.Location = New-Object System.Drawing.Point(180, 480)
$btnDesmarcarTodos.Size = New-Object System.Drawing.Size(150, 35)
$btnDesmarcarTodos.Text = "Desmarcar Todos"
$btnDesmarcarTodos.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$btnDesmarcarTodos.Add_Click({
    foreach ($cb in $checkboxes.Values) {
        $cb.Checked = $false
    }
})
$form.Controls.Add($btnDesmarcarTodos)

# Botao BAIXAR
$btnBaixar = New-Object System.Windows.Forms.Button
$btnBaixar.Location = New-Object System.Drawing.Point(480, 480)
$btnBaixar.Size = New-Object System.Drawing.Size(180, 40)
$btnBaixar.Text = "BAIXAR E INSTALAR"
$btnBaixar.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$btnBaixar.BackColor = [System.Drawing.Color]::Green
$btnBaixar.ForeColor = [System.Drawing.Color]::White
$btnBaixar.FlatStyle = "Flat"
$form.Controls.Add($btnBaixar)

# Label de status
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Location = New-Object System.Drawing.Point(20, 530)
$statusLabel.Size = New-Object System.Drawing.Size(640, 20)
$statusLabel.Text = "Pronto para instalar!"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$form.Controls.Add($statusLabel)

# Acao do botao BAIXAR
$btnBaixar.Add_Click({
    $selecionados = @()
    foreach ($id in $checkboxes.Keys) {
        if ($checkboxes[$id].Checked) {
            $selecionados += $id
        }
    }
    
    if ($selecionados.Count -eq 0) {
        [System.Windows.Forms.MessageBox]::Show("Selecione pelo menos um programa!", "Aviso", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }
    
    $resultado = [System.Windows.Forms.MessageBox]::Show("Deseja instalar $($selecionados.Count) programa(s)?`n`nIsso pode demorar varios minutos.", "Confirmar", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    
    if ($resultado -eq [System.Windows.Forms.DialogResult]::Yes) {
        $form.Hide()
        
        # Criar janela de progresso
        $progressForm = New-Object System.Windows.Forms.Form
        $progressForm.Text = "Instalando..."
        $progressForm.Size = New-Object System.Drawing.Size(500, 200)
        $progressForm.StartPosition = "CenterScreen"
        $progressForm.FormBorderStyle = "FixedDialog"
        $progressForm.ControlBox = $false
        
        $progressLabel = New-Object System.Windows.Forms.Label
        $progressLabel.Location = New-Object System.Drawing.Point(20, 20)
        $progressLabel.Size = New-Object System.Drawing.Size(450, 30)
        $progressLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10)
        $progressForm.Controls.Add($progressLabel)
        
        $progressBar = New-Object System.Windows.Forms.ProgressBar
        $progressBar.Location = New-Object System.Drawing.Point(20, 60)
        $progressBar.Size = New-Object System.Drawing.Size(450, 30)
        $progressBar.Style = "Continuous"
        $progressForm.Controls.Add($progressBar)
        
        $detailsLabel = New-Object System.Windows.Forms.Label
        $detailsLabel.Location = New-Object System.Drawing.Point(20, 100)
        $detailsLabel.Size = New-Object System.Drawing.Size(450, 50)
        $detailsLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
        $progressForm.Controls.Add($detailsLabel)
        
        $progressForm.Show()
        $progressForm.Refresh()
        
        # Instalar programas
        $total = $selecionados.Count
        $atual = 0
        
        foreach ($id in $selecionados) {
            $atual++
            $progressBar.Value = [int](($atual / $total) * 100)
            $progressLabel.Text = "Instalando $atual de $total..."
            $detailsLabel.Text = "Programa: $id"
            $progressForm.Refresh()
            
            try {
                winget install --id $id --silent --accept-source-agreements --accept-package-agreements
            } catch {
                # Continua mesmo se der erro
            }
        }
        
        $progressForm.Close()
        [System.Windows.Forms.MessageBox]::Show("Instalacao concluida!`n`n$total programa(s) foram instalados.", "Sucesso", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        $form.Close()
    }
})

# Mostrar form
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()