@echo off
set "server=vpn-server.uni-bayreuth.de"
set "ui=csc_ui.exe"
set "cli=C:\Program Files (x86)\Cisco\Cisco Secure Client\vpncli.exe"
tasklist | find /i "%ui%" > nul && taskkill /f /im "%ui%" > nul
powershell.exe -NoProfile -Command "Write-Output 'connect %server%'; Write-Output ''; Write-Output $env:BT_USERNAME; Write-Output $env:BT_PASSWORD" | "%cli%" -s
if %ERRORLEVEL% neq 0 (pause)