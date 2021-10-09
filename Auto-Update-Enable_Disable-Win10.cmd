@echo off

title kuyhAa - Disable/Enable Windows 10 Automatic Updates
color 1f
:Begin UAC check and Auto-Elevate Permissions
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo:
echo   Requesting Administrative Privileges...
echo   Press YES in UAC Prompt to Continue
echo:

    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:Check Windows Version
wmic os get version | find /i "10.">nul 2>nul
if %errorlevel% neq 0 GOTO :Not10

:Check the key:
(reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate"|find /i "0x1")>NUL 2>NUL
if %errorlevel% neq 0 GOTO :KEYOFF

:KEYON
echo ============================================================
echo TechTutors.site
echo Otomatis Update saat ini sedang dinonaktifkan/disabled.
echo Apakah Anda ingin re-enable otomatis update windows? ketik: Y atau N
echo ============================================================
echo.
choice /c yn /n
If %ERRORLEVEL% NEQ 1 GOTO :QUIT

echo Mencoba untuk menutup layanan Windows Update jika itu sedang berjalan
net stop wuauserv>NUL 2>NUL
echo.

Echo Changing Registry key
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /D 0 /T REG_DWORD /F>NUL 2>NUL
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR
Echo.

Echo Selamat! Otomatis update telah diaktifkan/enable
Echo.
goto :QUIT


:KEYOFF
echo ============================================================
echo Techtutors.site
echo Otomatis Update saat ini sedang diaktifkan/enabled.
echo Apakah Anda ingin disable/menonaktifkan otomatis update windows? ketik: Y atau N
echo ============================================================
echo.
choice /c yn /n
If %ERRORLEVEL% NEQ 1 GOTO :QUIT

echo Mencoba untuk menutup layanan Windows Update jika itu sedang berjalan
net stop wuauserv>NUL 2>NUL
echo.

Echo Changing Registry key
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /D 1 /T REG_DWORD /F>NUL 2>NUL
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR
Echo.

Echo Selamat! Otomatis update telah dinonaktifkan/disable
Echo.
goto :QUIT


:QUIT
echo ============================================================
echo Tekan Enter untuk keluar...
echo ============================================================
pause>NUL
goto :EOF

:ERROR
echo ============================================================
echo The script ran into an unexpected error setting reg key.
echo Tekan Enter untuk keluar...
echo ============================================================
pause>NUL
goto :EOF

:Not10
echo ============================================================
echo Script ini hanya dibuat untuk Windows 10...
echo Tekan Enter untuk keluar...
echo ============================================================
pause>NUL
goto :EOF