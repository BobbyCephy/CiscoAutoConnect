@echo off
"C:\Program Files (x86)\Cisco\Cisco Secure Client\vpncli.exe" disconnect
if %ERRORLEVEL% neq 0 (pause)