@echo off

setlocal EnableDelayedExpansion

color 0a
title Winkey 1.0 by N11rm44L 7w44711

set "chrs= qwertyuiopasdfghjklzxcvbnm1234567890"

echo -----------------------------
echo / Tool   : Winkey 1.0       \
echo \ Author : N11rm44L 7w44711 /
echo / Log File : logs.txt       \
echo -----------------------------

set /p inp="[Start ( YES (any key) / NO (N|n)]=> "
if %inp%==N (exit)
if %inp%==n (exit)
echo Log File : logs.txt

:winky
cls
choice /c %chrs% >nul
>> logs.txt echo !chrs:~%errorlevel%,1!
goto winky