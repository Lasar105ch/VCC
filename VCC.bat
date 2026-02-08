@echo off

:: Color and title settings.

setlocal EnableDelayedExpansion
title Windows Control Center
mode con cols=80 lines=30
color 07

:: Administrator checks

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:: logs when the program was started
echo [%date% %time%] Term-Desk started >> termdesk.log

:: Main menu ofc

:menu
cls

echo ========================================================================
echo =                       VCC (Windows Control Center)                   =
echo =                                 Welcome                              =
echo =                                                                      =
echo ========================================================================
echo =   User: %USERNAME%    PC: %COMPUTERNAME%    Date: %date% %time%      =
echo ========================================================================
echo =                         Please select a option:                      = 
echo ========================================================================
echo =                                                                      =
echo =  1.  Open a app                11. Files Tools                       =
echo =  2.  System Information        12. Process Manager                   =
echo =  3.  Network Tools             13. Patch Notes                       =
echo =  4.  Cleanup Temp Files                                              =
echo =  5.  Winver                                                          =
echo =  6.  Restart VCC                                                     =
echo =  7.  Shutdown PC                                                     =
echo =  8.  Restart PC                                                      =
echo =  9.  Log Off                                                         =
echo =  10. VCC Info                                                        =
echo =                                                                      =
echo ========================================================================
set /p c=Select option: 
if "%c%"=="1" goto apps
if "%c%"=="2" goto SysInfo
if "%c%"=="3" goto NetTools
if "%c%"=="4" goto TempDel
if "%c%"=="5" goto Winver
if "%c%"=="6" goto TempDeskReset
if "%c%"=="7" goto Shutdown
if "%c%"=="8" goto Restart
if "%c%"=="9" goto Logoff
if "%c%"=="10" goto VccInfo
if "%c%"=="11" goto FileTool
if "%c%"=="12" goto ProcessMang
if "%c%"=="13" goto Patchnotes

:: Apps menu

:APPS
cls
echo ========================================================================
echo =                                                                      =
echo =                              App Launcher                            =
echo =                                                                      =
echo ========================================================================
echo =                         Please select a option:                      = 
echo ========================================================================
echo =                                                                      =
echo =   1. Notepad                                                         =
echo =   2. Calculator                                                      =
echo =   3. Explorer                                                        =
echo =   4. Chrome                                                          =
echo =   5. PowerShell                                                      =
echo =   6. Back                                                            =
echo =                                                                      =
echo ========================================================================
set /p a=Select: 

if "%a%"=="1" start notepad
if "%a%"=="2" start calc
if "%a%"=="3" start explorer
if "%a%"=="4" start chrome
if "%a%"=="5" start powershell  
if "%a%"=="6" goto menu 
pause 
goto menu 

:: Opens Winver

:Winver
cls
echo ========================================================================
echo =                                                                      =
echo =                              Winver Opened                           =
echo =                                                                      =
echo ========================================================================
Winver
goto menu

:: Finds sysinfo using, systeminfo ofc. 
:: Tried using wmic but it ain't workin

:SysInfo
cls
echo ========================================================================
echo =                                                                      =
echo =                         System Information                           =
echo =                                                                      =
echo ========================================================================
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.
pause
goto menu

:: Pings google u can change the website to /any/ website

:NetTools
cls
echo ========================================================================
echo =                                                                      =
echo =                            Network Tools                             =
echo =                                                                      =
echo ========================================================================
echo =                         Please select a option:                      = 
echo ========================================================================
echo =                                                                      =
echo =   1. Ping Config                                                     =
echo =   2. Ping Google (check wifi connection)                             =
echo =   3.Back                                                             =
echo =                                                                      =
echo ========================================================================
set /p n=Select: 

if "%n%"=="1" ipconfig
if "%n%"=="2" ping google.com
if "%n%"=="3" goto menu
pause 
goto NetTools

:: Deletes temp files tho

:TempDel
cls
echo ========================================================================
echo =                                                                      =
echo =                            Network Tools                             =
echo =                                                                      =
echo ========================================================================
echo =                        Cleaning Temperary Files                     = 
echo ========================================================================
del /f /q "%TEMP%\*" >nul 2>&1
rmdir /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%"
echo ========================================================================
echo =                                Done                                  = 
echo ========================================================================
pause
goto menu

:: Just fancy refresh.

:TempDeskReset
cls
echo ========================================================================
echo =                                                                      =
echo =                            Restarting VCC                            =
echo =                                                                      =
echo ========================================================================
echo =                    Press any key to go to the menu                   = 
echo ========================================================================
pause
goto menu

:: Shutdown, Restart, Log Off things.
:: PS: If your using this as a learning file DO NOT
:: forget to put "goto menu" or your pc will be off soon.

:Shutdown
cls
echo ========================================================================
echo =                                                                      =
echo =                   ARE YOU SURE YOU WANT TO SHUTDOWN?                 =
echo =                                                                      =
echo ========================================================================
echo =                    PRESS ANY KEY IF YOU ARE SURE                     = 
echo ========================================================================
pause
shutdown /s /t 0
goto menu

:Restart
cls 
echo ========================================================================
echo =                                                                      =
echo =                   ARE YOU SURE YOU WANT TO RESTART?                  =
echo =                                                                      =
echo ========================================================================
echo =                    PRESS ANY KEY IF YOU ARE SURE                     = 
echo ========================================================================
pause 
shutdown /r /t 0
goto menu

:Logoff
cls
echo ========================================================================
echo =                                                                      =
echo =                   ARE YOU SURE YOU WANT TO LOG OFF?                  =
echo =                                                                      =
echo ========================================================================
echo =                    PRESS ANY KEY IF YOU ARE SURE                     = 
echo ========================================================================
pause 
shutdown /l
goto menu

:: VCC Info tab

:VccInfo
cls
echo ========================================================================
echo =                                                                      =
echo =                              VCC Verison                             =
echo =                                                                      =
echo ========================================================================
echo =                             Version: 1.0.0                           = 
echo =                             Github:                                  = 
echo ========================================================================
pause
goto menu

:: Files shi

:FileTool
cls
echo ====            ====
echo ==== File Tools ====
echo ====            ====
echo ====   BETA UI  ====
echo 1. Create File
echo 2. Delete File
echo 3. Create Folder
echo 4. Delete Folder
echo 5. Open Folder
echo 6. Back
set /p f=Select: 

if "%f%"=="1" (
    set /p name=File name:
    type nul > "%name%"
)
if "%f%"=="2" (
    set /p name=File name:
    del "%name%"
)
if "%f%"=="3" (
    set /p name=Folder name:
    mkdir "%name%"
)
if "%f%"=="4" (
    set /p name=Folder name:
    rmdir /s /q "%name%"
)
if "%f%"=="5" (
    set /p name=Folder path:
    explorer "%name%"
)
if "%f%"=="6" goto menu

echo [%date% %time%] File operation >> termdesk.log
pause
goto FileTools

:: God help me with ProcessManager lol

:ProcessMang
cls 
echo ==== Process Manager ====
echo ==== This feature is still kinda broken. ====
echo ==== It will be fixed in future updates. ====
echo ==== BETA UI ====
echo 1. List Processes
echo 2. Kill Process
echo 3. Back
set /p p=Select: 

if "%p%"=="1" tasklist
pause
goto ProcessMang

if "%p%"=="2" (
    set /p proc=Process name (example.exe):
    taskkill /im "%proc%" /f
)
if "%p%"=="3" goto menu


:: idk why it won't work without this lol, maybe wrote wrong or im just stoopid :p
pause
:ProcessMang

:: Patch notes, nothing special

:Patchnotes
cls
echo ==== Patch Notes ====
echo First Version, ofc there isn't going to be
echo anything lmaoo :p
pause 
goto menu