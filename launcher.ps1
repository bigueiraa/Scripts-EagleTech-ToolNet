# URL do seu arquivo BAT (Confirme se comeca com raw.githubusercontent.com)
$batUrl = "bit.ly/eagle-toolnetcmd"
$batPath = "$env:TEMP\EagleTech_ToolNet.bat"

Write-Host "Iniciando Eagle Tech ToolNet..." -ForegroundColor Cyan

try {
    # Baixa o arquivo forçando a não usar cache
    Invoke-WebRequest -Uri $batUrl -OutFile $batPath -UseBasicParsing -Headers @{"Cache-Control"="no-cache"}
} catch {
    Write-Host "[ERRO] Nao foi possivel baixar o arquivo .bat. Verifique sua conexao ou o link." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    return
}

# Verifica se o arquivo baixado não é HTML ou se está vazio
$conteudo = Get-Content $batPath -Raw
if ($conteudo -match "<html" -or $conteudo.Length -lt 50) {
    Write-Host "[ERRO] O link fornecido parece estar baixando uma pagina web em vez do codigo bruto." -ForegroundColor Red
    Write-Host "Certifique-se de usar o link RAW do arquivo no GitHub." -ForegroundColor Yellow
    return
}

Write-Host "Solicitando privilegios de Administrador..." -ForegroundColor Yellow

# Inicia o processo. Usamos /k temporariamente para manter a janela aberta caso dê erro no CMD
Start-Process -FilePath "cmd.exe" -ArgumentList "/k `"$batPath`"" -Verb RunAs
