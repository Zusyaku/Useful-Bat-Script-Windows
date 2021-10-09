@echo off
REM By Niirmaal twaatii
:: https://www.github.com/niirmaaltwaatii/WinPop
: 7w44711
color 0a 
title WinPop 1.5

:: Banner
echo ----------------------------------------------------------
echo / Tool : WinPop                                          \
echo \ Version : 1.5                                          /  
echo / Author : Niirmaal Twaatii                              \
echo \ Description : Cutomize and Show PopUp Messages         /
echo / GitHub : https://www.github.com/niirmaaltwaatii/WinPop \
echo -----------------------------------------------------------

:: Take Inputs
set /p ttl="Enter Title: "
set /p txt="Enter a Message: "

:: Show Msg Types
echo ------------------------------------
echo Message Types :-
echo [0] Normal Msg - Ok button Only
echo [1] OK and Cancel buttons
echo [2] Abort, Retry, and Ignore buttons
echo [3] Yes, No, and Cancel buttons
echo [4] Yes and No buttons
echo [5] Retry and Cancel buttons
echo [16] Critical Message icon
echo [32] Warning Query icon
echo [48] Warning Message icon
echo [64] Information Message icon
echo ------------------------------------

:: Set Msg Type
set /p typ="Select Message Type: "

REM Show Message
cscript MsgBx.vbs "%txt%" "%ttl%" %typ%

::niirmaaltwaatii
set /p inp=" Use Again ? ( Y/N ) : "
if %inp%==N (goto end)
if %inp%==n (goto end)
echo -
goto 7w44711

:end