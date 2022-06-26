echo off
cls 
:start
echo Ethernet
echo 1. Do you want to enable? 
echo 2. Do you want to disable?
echo 3. Do you want to exit?

echo Press: 1
echo Press: 2
echo Press: 3

set /p press= Press:

if '%Press%'=='1' goto :press1
if '%Press%'=='2' goto :press2
if '%Press%'=='3' goto :press3
echo "%Press%" is not a valid option. Please, try again. 
echo

goto start
:press1
netsh interface set interface "Ethernet" admin=Enable
goto end 
:end
pause
goto start  
:press2
netsh interface set interface "Ethernet" admin=disable
goto end 
:end
goto start
:press3
exit
