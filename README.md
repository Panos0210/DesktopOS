# DesktopOS my own Windows 11 iso 

this is a lightweight version of windows made by me with the ntlite config file so if you dont trust the .iso file (which you shouldnt trust files from strangers) if you have ntlite you can make it yourself

it also includes a windows tweak bat file that changes somethings in the registry and improve windows 11 (it also automatically installs winget if for some reason isnt installed by default)


to run the tweak file on any computer and it will always be updated run this command in powershell/terminal dont worry if you dont run it as admin it will do it for you once you (if you want the source code go [here](https://raw.githubusercontent.com/Panos0210/DesktopOS/refs/heads/main/All%20Tweaks.bat))
```
iwr -useb "https://is.gd/wintweaks" -OutFile "$env:TEMP\tweaks.bat"; Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"& `"$env:TEMP\tweaks.bat`"" -Verb RunAs
```

or if for whatever reason dont want to use that one bc it has an is.gd link and you dont know eher it could redirect
```
iwr -useb "https://raw.githubusercontent.com/Panos0210/DesktopOS/refs/heads/main/All%20Tweaks.bat" -OutFile "$env:TEMP\tweaks.bat"; Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"& `"$env:TEMP\tweaks.bat`"" -Verb RunAs
```

credits to dave Kirkwood (heytulsiprasad no github) for the [removing edge script](https://gist.github.com/heytulsiprasad/670b7451a1931cfd354c4813c74ac181)
