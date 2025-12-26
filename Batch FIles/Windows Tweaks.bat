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
echo 2) Debloat Windows
echo 3) Gaming Options
echo 4) Privacy Tweaks
echo 5) Windows Update Options
echo 6) DNS Options
echo 7) Remove Microsoft Edge
echo 8) System Corruption Scan
echo 9) Install WinGet
echo A) Update All Apps (Requires WinGet)
choice /C:0123456789A /N /M ">"
set _erl=%errorlevel%

if %_erl%==1 exit /b
if %_erl%==2 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://spoo.me/alltweaks | iex" & goto :continue
if %_erl%==3 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://spoo.me/debloat | iex" & goto :continue
if %_erl%==4 cls & goto :gamingoptions
if %_erl%==5 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://spoo.me/privacytweaks | iex" & goto :continue
if %_erl%==6 cls & goto :updateoptions
if %_erl%==7 cls & goto :dnsoptions
if %_erl%==8 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://spoo.me/removeedge | iex" & goto :continue
if %_erl%==9 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Write-Host 'Running Chkdsk (1/4)' -ForegroundColor Green; chkdsk /scan; Write-Host 'Running 1st SFC scan (2/4)' -ForegroundColor Green; sfc /scannow; Write-Host 'Running DISM (3/4)' -ForegroundColor Green; DISM /Online /Cleanup-Image /RestoreHealth; Write-Host 'Running 2nd SFC scan (4/4)' -ForegroundColor Green; sfc /scannow; pause" & goto :continue
if %_erl%==10 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" & goto :continue
if %_erl%==11 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget upgrade --all; pause" & goto :continue
goto :options


:gamingoptions
cls
echo ============================================
echo             Gaming Options
echo ============================================
echo.
echo 0) Back
echo 1) Gaming Optimizations
echo 2) Hardcore Performance Optimizations
echo 3) Fix "Get an app to open ms-gamebar" error
echo.
choice /C:0123 /N /M ">"
set _erl=%errorlevel%

if %_erl%==1 goto :continue
if %_erl%==2 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://spoo.me/gamemode | iex" & goto :gamingoptions
if %_erl%==3 cls & goto :hardcorewarning
if %_erl%==4 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/AveYo/Gaming/refs/heads/main/ms-gamebar-annoyance.bat | iex" & goto :gamingoptions
goto :gamingoptions


:hardcorewarning
cls
echo ============================================
echo    Hardcore Performance Optimizations
echo ============================================
echo.
echo WARNING: This will disable the following:
echo.
echo   - Transparency Effects
echo   - Window Animations
echo   - Taskbar Animations
echo   - Menu Fade Effects
echo   - Cursor Blink
echo.
echo This improves performance but makes Windows
echo look less visually appealing.
echo.
echo 0) Back
echo 1) Apply Hardcore Performance Optimizations
echo.
choice /C:01 /N /M ">"
set _erl=%errorlevel%

if %_erl%==1 goto :gamingoptions
if %_erl%==2 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://spoo.me/hardcoregamemode | iex" & goto :gamingoptions
goto :hardcorewarning


:updateoptions
cls
echo ============================================
echo         Windows Update Options
echo ============================================
echo.
echo 0) Back
echo 1) Set Windows Updates to Default
echo 2) Set Windows Updates to Security Only (recommended)
echo 3) Set Windows Updates to Disable All (not recommended)
echo.
choice /C:0123 /N /M ">"
set _erl=%errorlevel%

if %_erl%==1 goto :continue
if %_erl%==2 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/ChrisTitusTech/winutil/refs/heads/main/functions/public/Invoke-WPFUpdatesdefault.ps1 | iex" & goto :updateoptions
if %_erl%==3 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/ChrisTitusTech/winutil/refs/heads/main/functions/public/Invoke-WPFUpdatessecurity.ps1 | iex" & goto :updateoptions
if %_erl%==4 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/ChrisTitusTech/winutil/refs/heads/main/functions/public/Invoke-WPFUpdatesdisable.ps1 | iex" & goto :updateoptions
goto :updateoptions


:dnsoptions
cls
echo ============================================
echo               DNS Options
echo ============================================
echo.
echo 0) Back
echo 1) Cloudflare (1.1.1.1) - Fast, privacy-focused
echo 2) Google (8.8.8.8) - Reliable, fast
echo 3) Quad9 (9.9.9.9) - Security-focused, blocks malware
echo 4) AdGuard (94.140.14.14) - Blocks ads and trackers
echo 5) Reset to Automatic (DHCP)
echo.
choice /C:012345 /N /M ">"
set _erl=%errorlevel%

if %_erl%==1 goto :continue
if %_erl%==2 goto :dns_cloudflare
if %_erl%==3 goto :dns_google
if %_erl%==4 goto :dns_quad9
if %_erl%==5 goto :dns_adguard
if %_erl%==6 goto :dns_reset
goto :dnsoptions

:dns_cloudflare
echo.
echo Setting DNS to Cloudflare...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses '1.1.1.1','1.0.0.1' }"
echo Done!
timeout /t 2 >nul
goto :dnsoptions

:dns_google
echo.
echo Setting DNS to Google...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses '8.8.8.8','8.8.4.4' }"
echo Done!
timeout /t 2 >nul
goto :dnsoptions

:dns_quad9
echo.
echo Setting DNS to Quad9...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses '9.9.9.9','149.112.112.112' }"
echo Done!
timeout /t 2 >nul
goto :dnsoptions

:dns_adguard
echo.
echo Setting DNS to AdGuard...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses '94.140.14.14','94.140.15.15' }"
echo Done!
timeout /t 2 >nul
goto :dnsoptions

:dns_reset
echo.
echo Resetting DNS to Automatic...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ResetServerAddresses }"
echo Done!
timeout /t 2 >nul
goto :dnsoptions


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



