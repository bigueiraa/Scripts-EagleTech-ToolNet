# Esconde erros para uma execucao mais limpa
$ErrorActionPreference = "SilentlyContinue"

# URL do seu arquivo BAT (Cole o link RAW aqui dentro das aspas)
$batUrl = "bit.ly/eagle-toolnet"

# Define que o BAT sera salvo na pasta temporaria do Windows
$batPath = "$env:TEMP\EagleTech_ToolNet.bat"

Write-Host "Iniciando Eagle Tech ToolNet..." -ForegroundColor Cyan

# Baixa o arquivo BAT do GitHub
Invoke-WebRequest -Uri $batUrl -OutFile $batPath

Write-Host "Solicitando privilegios de Administrador..." -ForegroundColor Yellow

# Executa o BAT chamando o CMD como Administrador
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$batPath`"" -Verb RunAs
