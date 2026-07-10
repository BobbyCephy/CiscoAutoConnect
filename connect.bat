@echo off

set "server=vpn-server.uni-bayreuth.de"
set "credentialsPath=%userprofile%\Documents"
set "credentialsFile=%credentialsPath%\credentials.txt"
set "credentialsFileTemp=%credentialsPath%\credentialsTemp.txt"
set "ui=csc_ui.exe"
set "cli=C:\Program Files (x86)\Cisco\Cisco Secure Client\vpncli.exe"

tasklist | find /i "%ui%" > nul && taskkill /f /im "%ui%" > nul

for /f "usebackq delims=" %%A in ("%credentialsFile%") do (
    if not defined name (
        set "name=%%A"
    ) else (
        set "password=%%A"
    )
)

del "%credentialsFileTemp%" 2>nul

(
    echo connect %server%
    echo.
    echo %name%
    echo %password%
) > "%credentialsFileTemp%"

"%cli%" -s < "%credentialsFileTemp%"

if %ERRORLEVEL% neq 0 (pause)

del "%credentialsFileTemp%"