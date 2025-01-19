@echo off
if not "%COMSPEC%"=="" goto continue
start cmd.exe /k "%~f0"
exit

:continue
chcp 65001 >nul
mode con: cols=161 lines=45
title Windows Tweaks - by panso
call :banner
goto :options


:options
echo 0) Exit
echo 1) All Windows Tweaks
echo 2) Disable Updates to Only 23H2
echo 3) Disable Updates to Only 24H2
echo 4) Remove Microsoft Edge
echo 5) System Corruption Scan
echo 6) Install WinGet
echo 7) Update All Apps (Requires WinGet)
choice /C:123456780 /N /M ">"
set _erl=%errorlevel%

if %_erl%==8 exit /b
if %_erl%==7 setlocal & start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget upgrade --all"
if %_erl%==6 setlocal & start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-BitsTransfer -Source "https://aka.ms/getwinget" -Destination "C:\winget.msixbundle"; Add-AppxPackage C:\winget.msixbundle; Remove-Item -Force C:\winget.msixbundle"
if %_erl%==5 setlocal & start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Write-Host 'Running Chkdsk (1/4)' -ForegroundColor Green; chkdsk /scan; Write-Host 'Running 1st SFC scan (2/4)' -ForegroundColor Green; sfc /scannow; Write-Host 'Running DISM (3/4)' -ForegroundColor Green; DISM /Online /Cleanup-Image /RestoreHealth; Write-Host 'Running 2nd SFC scan (4/4)' -ForegroundColor Green; sfc /scannow; pause"
if %_erl%==4 setlocal & start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/removeedge | iex"
if %_erl%==3 setlocal & start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/24H2 | iex"
if %_erl%==2 setlocal & start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/23H2 | iex"
if %_erl%==1 setlocal & start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/alltweaks | iex"

goto :continue

:menu
cls
call :banner
call :options
goto :menu

:banner
echo.
echo.
echo                               ,,                    ,,                                                                                                    
echo         `7MMF'     A     `7MF'db                  `7MM                                       MMP""MM""YMM                               `7MM              
echo           `MA     ,MA     ,V                        MM                                       P'   MM   `7                                 MM              
echo            VM:   ,VVM:   ,V `7MM  `7MMpMMMb.   ,M""bMM  ,pW"Wq.`7M'    ,A    `MF',pP"Ybd          MM `7M'    ,A    `MF'.gP"Ya   ,6"Yb.    MM  ,MP',pP"Ybd 
echo             MM.  M' MM.  M'   MM    MM    MM ,AP    MM 6W'   `Wb VA   ,VAA   ,V  8I   `"          MM   VA   ,VAA   ,V ,M'   Yb 8)   MM    MM ;Y   8I   `" 
echo             `MM A'  `MM A'    MM    MM    MM 8MI    MM 8M     M8  VA ,V  VA ,V   `YMMMa.          MM    VA ,V  VA ,V  8M""""""  ,pm9MM    MM;Mm   `YMMMa. 
echo              :MM;    :MM;     MM    MM    MM `Mb    MM YA.   ,A9   VVV    VVV    L.   I8          MM     VVV    VVV   YM.    , 8M   MM    MM `Mb. L.   I8 
echo               VF      VF    .JMML..JMML  JMML.`Wbmd"MML.`Ybmd9'     W      W     M9mmmP'        .JMML.    W      W     `Mbmmd' `Moo9^Yo..JMML. YA.M9mmmP' 
echo.
echo.
