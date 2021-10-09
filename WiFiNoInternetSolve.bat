@echo off
REM b1 N11rm44L 7w44711

:netsh
netsh winsock reset
netsh int ip reset

:ipconfig
ipconfig /release
ipconfig /renew
ipconfig /flushdns

echo Process Done ! Now Restart Your PC !
::shutdown /s