@echo off
if not "%COMSPEC%"=="" goto continue
start cmd.exe /k "%~f0"
exit

:continue
chcp 65001 >nul
mode con: cols=161 lines=45
title Windows Tweaks - by panso
goto :menu

:menu
cls
call :banner
call :options
goto :menu

:options
echo 1) All Windows Tweaks
echo 2) Disable Updates to Only 23H2
echo 3) Disable Updates to Only 24H2
echo 4) Remove Microsoft Edge
echo 5) Exit

choice /C 12345 /N /M "Select an option:"

if errorlevel 5 goto :exit
if errorlevel 4 goto :remove_edge
if errorlevel 3 goto :disable_24H2
if errorlevel 2 goto :disable_23H2
if errorlevel 1 goto :all_tweaks

goto :menu

:all_tweaks
start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/alltweaks | iex"
goto :menu

:disable_23H2
start "" powershell -NoProfile -Execution
