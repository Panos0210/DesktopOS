@echo off
if not "%COMSPEC%"=="" goto continue
start cmd.exe /k "%~f0"
exit

:continue
chcp 65001 >nul
mode con: cols=150 lines=45
title Network Tool - by panso
goto banner

:banner

echo.
echo.
echo                                                                                                                  ,,  
echo             `7MN.   `7MF'         mm                                   `7MM          MMP""MM""YMM              `7MM  
echo               MMN.    M           MM                                     MM          P'   MM   `7                MM  
echo               M YMb   M  .gP"Ya mmMMmm `7M'    ,A    `MF',pW"Wq.`7Mb,od8 MM  ,MP'         MM  ,pW"Wq.   ,pW"Wq.  MM  
echo               M  `MN. M ,M'   Yb  MM     VA   ,VAA   ,V 6W'   `Wb MM' "' MM ;Y            MM 6W'   `Wb 6W'   `Wb MM  
echo               M   `MM.M 8M""""""  MM      VA ,V  VA ,V  8M     M8 MM     MM;Mm            MM 8M     M8 8M     M8 MM  
echo               M     YMM YM.    ,  MM       VVV    VVV   YA.   ,A9 MM     MM `Mb.          MM YA.   ,A9 YA.   ,A9 MM  
echo             .JML.    YM  `Mbmmd'  `Mbmo     W      W     `Ybmd9'.JMML. .JMML. YA.       .JMML.`Ybmd9'   `Ybmd9'.JMML.
                                                                                                         
echo.
echo.




pause
