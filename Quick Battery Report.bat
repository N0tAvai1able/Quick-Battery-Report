@echo off
powercfg /batteryreport >nul 2>&1

:: Check if the Reports folder exists, and create it if it doesn't
if not exist "Reports\" mkdir "Reports"

for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"
set "fullstamp=%YY%%MM%%DD%-%HH%%Min%%Sec%"

move battery-report.html "Reports\battery-report-%fullstamp%.html" >nul 2>&1
start Reports\battery-report-%fullstamp%.html