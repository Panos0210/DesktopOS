# DesktopOS my own Windows 11 iso 

this is a lightwaeight version of windows made by me with the ntlite config file so if you dont trust the .iso file (which you shouldnt trust files from strangers) if you have ntlite you can make it yourself

it also includes a registry edit bat file thaty changes somethings in the registry and improve windows 11


to run the registry edit file on any computer and it will always be updated run this command in powershell as admin (if you want the source code go [here](https://github.com/Panos0210/DesktopOS/blob/main/All%20Registry%20Tweaks.bat)
```
iwr -useb "https://is.gd/regedits" -OutFile "$env:TEMP\reg.bat"; Start-Process "cmd.exe" -ArgumentList "/c `"$env:TEMP\reg.bat`""
```

or if for whatever reason dont want to use that one bc it has an is.gd link and you dont know eher it could redirect
```
iwr -useb "https://raw.githubusercontent.com/Panos0210/DesktopOS/refs/heads/main/All%20Registry%20Tweaks.bat" -OutFile "$env:TEMP\reg.bat"; Start-Process "cmd.exe" -ArgumentList "/c `"$env:TEMP\reg.bat`""
```

credits to dave Kirkwood (heytulsiprasad no github) for the [removing edge script](https://gist.github.com/heytulsiprasad/670b7451a1931cfd354c4813c74ac181)
