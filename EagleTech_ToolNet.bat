@echo off
:: Garante que o script rode da pasta atual
cd /d "%~dp0"

:: Verificacao de Administrador
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo ================================================================================
    echo [AVISO] Por favor, execute este arquivo clicando com o Botao Direito e 
    echo escolhendo "Executar como Administrador"!
    echo ================================================================================
    pause
    exit /b
)

title EAGLE TECH TOOLNET

:menu
cls
echo ================================================================================
echo                 E A G L E   T E C H
echo                 Suporte e Manutencao Avancada
echo ================================================================================
echo.
echo   [1] ipconfig / ifconfig (Validar IP, Gateway e DNS)
echo   [2] nslookup (Verificar problemas de DNS)
echo   [3] tracert / traceroute (Identificar falhas nos saltos)
echo   [4] pathping (Analise de rota e perda de pacotes)
echo   [5] netstat (Conexoes abertas e servicos)
echo   [6] telnet (Validar portas como 80, 443, 3389, 22)
echo   [7] Sair
echo.
echo ================================================================================
set /p opcao="Escolha uma opcao (1-7): "

if "%opcao%"=="1" goto op1
if "%opcao%"=="2" goto op2
if "%opcao%"=="3" goto op3
if "%opcao%"=="4" goto op4
if "%opcao%"=="5" goto op5
if "%opcao%"=="6" goto op6
if "%opcao%"=="7" goto sair
goto menu

:op1
cls
echo ================================================================================
echo   [1] ipconfig / ifconfig
echo ================================================================================
echo Essencial para validar IP, gateway, DNS e configuracao da interface.
echo.
ipconfig
echo.
pause
goto menu

:op2
cls
echo ================================================================================
echo   [2] nslookup
echo ================================================================================
echo Permite verificar problemas relacionados a DNS.
echo.
set /p host="Digite o dominio para testar (ex: google.com) ou Enter para voltar: "
if "%host%"=="" goto menu
echo.
nslookup %host%
echo.
pause
goto menu

:op3
cls
echo ================================================================================
echo   [3] tracert / traceroute
echo ================================================================================
echo Ajuda a identificar em qual salto a comunicacao esta falhando.
echo.
set /p host="Digite o IP ou dominio para rastrear a rota ou Enter para voltar: "
if "%host%"=="" goto menu
echo.
tracert %host%
echo.
pause
goto menu

:op4
cls
echo ================================================================================
echo   [4] pathping
echo ================================================================================
echo Combina analise de rota com perda de pacotes.
echo.
set /p host="Digite o IP ou dominio para analise ou Enter para voltar: "
if "%host%"=="" goto menu
echo.
pathping %host%
echo.
pause
goto menu

:op5
cls
echo ================================================================================
echo   [5] netstat
echo ================================================================================
echo Ajuda a identificar conexoes abertas e servicos em execucao.
echo.
netstat -an
echo.
pause
goto menu

:op6
cls
echo ================================================================================
echo   [6] telnet
echo ================================================================================
echo Muito util para validar conectividade em portas especificas, como:
echo  - 80 (HTTP)
echo  - 443 (HTTPS)
echo  - 3389 (RDP)
echo  - 22 (SSH)
echo.
set /p host="Digite o IP ou dominio ou Enter para voltar: "
if "%host%"=="" goto menu
set /p porta="Digite a porta para teste (ex: 443): "
if "%porta%"=="" goto menu
echo.
telnet %host% %porta%
echo.
pause
goto menu

:sair
exit