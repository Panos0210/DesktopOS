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
echo 1) All Windows Tweaks
echo 2) Disable Updates to Only 23H2
echo 3) Disable Updates to Only 24H2
echo 4) Remove Microsoft Edge
echo 5) Exit

choice /C 12345 /N /M "Select an option:"

if errorlevel 5 exit
if errorlevel 4 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/removeedge | iex"
if errorlevel 3 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/24H2 | iex"
if errorlevel 2 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/23H2 | iex"
if errorlevel 1 start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://rebrand.ly/alltweaks | iex"

cls
goto :options

:banner
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