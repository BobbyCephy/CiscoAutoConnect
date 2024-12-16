@echo off

set server=hrz24.hs-ansbach.de
set credentialsFile=%userprofile%\credentials.txt
set credentialsFileTemp=%userprofile%\credentialsTemp.txt
set ui=csc_ui.exe
set cli="C:\Program Files (x86)\Cisco\Cisco Secure Client\vpncli.exe"

tasklist | find /i "%ui%" > nul && taskkill /f /im %ui% > nul

for /f "tokens=*" %%A in ('more +0 %credentialsFile%') do (
	if not defined name (set name=%%A) else (set password=%%A)
)

set /p passwordSecond=Enter second password:

(
	echo connect %server%
	echo %name%
	echo %password%
	echo %passwordSecond%
) > %credentialsFileTemp%

%cli% -s < %credentialsFileTemp%

if %ERRORLEVEL% neq 0 (pause)

del %credentialsFileTemp%