@echo off
taskkill /f /im csc_ui.exe

set server=hrz24.hs-ansbach.de
set credentialsFile=%userprofile%\credentials.txt
set credentialsFileTemp=%userprofile%\credentialsTemp.txt

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

"C:\Program Files (x86)\Cisco\Cisco Secure Client\vpncli.exe" -s < %credentialsFileTemp%

if %ERRORLEVEL% neq 0 (pause)

del %credentialsFileTemp%