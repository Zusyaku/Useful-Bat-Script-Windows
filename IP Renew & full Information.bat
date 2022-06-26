@echo off

ipconfig /release
pause

ipconfig /renew
pause

ipconfig /flushdns
pause

ipconfig /registerdns
pause

netsh dump
pause

nbtstat -R
pause

netsh int ip reset reset.log
pause

netsh winsock reset
pause

:start
@echo.
@echo                 INFORMATION

@ipconfig /all | find "IP Address"
@ipconfig /all | find "IPv4 Address"
@ipconfig /all | find "Subnet Mask"
@ipconfig /all | find "Default Gateway"
@ipconfig /all | find "Host Name"
@ipconfig /all | find "DNS Suffix Search List"
@ipconfig /all | find "Physical Address"
@ipconfig /all | find "DHCP Enabled"
@ipconfig /all | find "DHCP Server"
@ping 127.0.0.1
@echo.
@pause
