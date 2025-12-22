@echo off

echo Adding Gaming Optimisations...
echo.

echo Disabling Fullscreen Optimizations...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "1" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
echo.

echo Setting GPU Priority...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
echo.

echo Setting Game Priority...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
echo.

echo Setting Scheduling Category to High...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
echo.

echo Setting SFIO Priority to High...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
echo.

echo Adjusting Win32 Priority Separation...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
echo.

echo Disabling Network Throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
echo.

echo Setting System Responsiveness to 0...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
echo.

echo Enabling Ultimate Performance Power Plan...
powercfg -list | findstr /C:"Ultimate Performance" >nul
if %errorlevel% neq 0 (
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul
)
for /f "tokens=4" %%a in ('powercfg -list ^| findstr /C:"Ultimate Performance"') do set "ultimatePlanGUID=%%a"
powercfg -setactive %ultimatePlanGUID%
echo Ultimate Performance Power Plan activated!
echo.

pause
