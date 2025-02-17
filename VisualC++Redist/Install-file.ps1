# Script para desinstalar todas as versões do VC_redist_x64 e instalar a versão mais recente

# Variável para o caminho do instalador do VC_redist_x64
$zipInstallerPath = "VC_redist_x64.exe"
$ScriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

#Função para desinstalar o VC_redist_x64 Exe
function Uninstall-VC_redist_x64-Exe {
    $product = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name LIKE '%Microsoft Visual C++%' AND Name LIKE '%x64%'"
   $productName = $product.Name
   Uninstall-Package -Name $productName -Force
}

# Função para instalar a versão mais recente do VC_redist_x64
function Install-VC_redist_x64-Exe {
    Start-Process -FilePath "$ScriptPath\$zipInstallerPath" -ArgumentList "/install", "/quiet", "/norestart" -Wait
}

# Desinstalar o VC_redist_x64 Exe
Uninstall-VC_redist_x64-Exe


# Instalar a versão mais recente do VC_redist_x64 Exe
Install-VC_redist_x64-Exe