@echo off
title Steganography_s_tool_1.2
color B
mode con: cols=60 lines=35
title s_tool_1.2
echo ----------------------------------------------------------
echo Its helping you to a hide any type of data  data in 
echo			.jpg/ .jpeg / .png  
echo made by KAUSHAL
echo ----------------------------------------------------------
echo	select
echo 	1 for LOGIN
echo 	2 for exit
set /p l1=enter your choice :-
IF %l1%==1 goto login
IF %l1%==2 goto THANKS
:login
cls
echo ---------------------------------------------------------
echo                       Login
echo ---------------------------------------------------------
echo.
echo.
set/p "unamel=_               Username : "
set/p "passwordl=_               Password : "
echo.
IF "%unamel%"=="" goto LOGINERROR
IF "%passwordl"=="" goto LOGINERROR
IF NOT %unamel%==KAUSHAL goto LOGINERROR
IF NOT %passwordl%==KAUSHAL goto LOGINERROR
goto LOADING

:LOGINERROR
echo --------------------------------------------------------
echo                     Error
echo --------------------------------------------------------
echo Invalid Username or password
pause
goto Login


:LOADING
title Loading...
set load=%load%!!!!!!!
cls
echo ---------------------------------------------------------
echo                       Login
echo ---------------------------------------------------------
echo.
echo.
echo                 Username : %unamel%
echo.                 
echo.
echo.
echo          Logging in...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Please Wait...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==5 goto DONE
goto LOADING

:DONE
title Done
cls
echo --------------------------------------------------------
echo                       Done
echo --------------------------------------------------------
echo.
echo               #
echo             #
echo     #     #            Login Successfully
echo      #  #
echo       #
echo.
echo.
echo ---------------------------------------------------------
pause
goto choice

:choice
title WHAT YOU WANT
cls
echo --------------------------------------------------------
echo               	what you want
echo --------------------------------------------------------
echo		1 for hidding data in file
echo		2 for unhidding data form file
echo		3 for log out
set /p enter=enter your choice :-
IF %enter%=="" goto wrongchoice
IF %enter%==1 goto choice1
IF %enter%==2 goto choice2
IF %enter%==3 goto LOAD1
:choice1
title hidding data in file
cls
echo -------------------------------------------------------
set path="C:\Program Files\WinRAR\rar";%path%
echo.
echo.
set /p source=enter the source file path:-
echo.
set /p hide=enter the hidden file path:-
echo.
set /p pass=enter the password for decompressing:-
msg * your key is %pass%
echo -------------------------------------------------------
echo.
echo 	copy the hidden file in the c:\hidden\ folder.
echo -------------------------------------------------------
mkdir c:\Users\%username%\Desktop\hidden
@echo off
copy %hide% c:\Users\%username%\Desktop\hidden\
echo.
echo.
echo	 now compressing the file in the dir of c:\
echo.
cd c:\hidden\
set path=C:\Program Files\WinRAR\
rar a -p%pass% c:\Users\%username%\Desktop\hidden\hidden.rar c:\Users\%username%\Desktop\hidden\*.*
echo.
echo.
echo 	your file is compressed.
echo.
echo.
echo -------------------------------------------------------
echo.
echo 		now moving to hidden your file
echo.
echo -------------------------------------------------------
copy /b %source%+c:\Users\%username%\Desktop\hidden\hidden.rar c:\Users\%username%\Desktop\%nname%.*
echo.
echo ------------------------------------------------------
echo.	now deleting a rar file from the drive
echo ------------------------------------------------------
echo.
echo.
echo.
echo. 	
echo.
echo.
echo.
echo.
RD /Q /S c:\Users\%username%\Desktop\hidden

goto choice
:wrongchoice
echo ----------------------------------------------------
echo                   wrongchoice
echo ----------------------------------------------------
echo 		INVALID CHOICE 
pause
goto choice
: choice2
TITLE unhidding data form file
cls
set /p UNDATA=enter the source file path:-
IF %UNDATA%=="" goto choice2
set path="C:\Program Files\WinRAR\";%path%
unrar x %UNDATA% c:\Users\%username%\Desktop\
cls
echo ------------------------------------------------------
echo                       Thnaks
echo ------------------------------------------------------
echo			Task Completed

echo	 		thankyou for using this

echo			YOUR FILE IS SAVE on DESKTOP
echo ------------------------------------------------------
PAUSE
goto choice

:LOAD1
title Loading...
set load=%load%!!!!
cls
echo ------------------------------------------------------
echo                       Logout
echo ------------------------------------------------------
echo.
echo			USER
echo			%unamel%
echo.
echo.
echo.
echo          Logging OUT...
echo======================================================
echo %load%
echo======================================================
echo.                              Please Wait...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==10 goto THANKS
goto LOAD1
:THANKS
title Thanks for using
cls
echo ------------------------------------------------------
echo                       Thnaks
echo ------------------------------------------------------
echo			thankyou for using this app
echo.	
echo ------------------------------------------------------
pause
exit