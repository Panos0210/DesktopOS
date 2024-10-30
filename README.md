# DesktopOS my own Windows 11 iso 

this is a lightwaeight version of windows made by me with the ntlite config file so if you dont trust the .iso file (which you shouldnt trust files from strangers) if you have ntlite you can make it yourself

it also includes a registry edit bat file thaty changes somethings in the registry and improve windows 11

'''
iwr -useb "https://raw.githubusercontent.com/Panos0210/DesktopOS/refs/heads/main/All%20Registry%20Tweaks.bat" -OutFile "$env:TEMP\AllRegistryTweaks.bat"; Start-Process "cmd.exe" -ArgumentList "/c `"$env:TEMP\AllRegistryTweaks.bat`""
'''
