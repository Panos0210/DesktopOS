# DesktopOS my own Windows 11 iso 

this is a lightweight version of windows made by me with the ntlite config file so if you dont trust the .iso file (which you shouldnt trust files from strangers) if you have ntlite you can make it yourself

it also includes a windows tweak bat file that changes somethings in the registry and improve windows 11 (it also automatically installs winget if for some reason isnt installed by default)

# Terminal Commands
to run the tweak file on any computer and it will always be updated run this command in powershell/terminal dont worry if you dont run it as admin it will do it for you once you (if you want the source code go [here](https://raw.githubusercontent.com/Panos0210/DesktopOS/refs/heads/main/All%20Tweaks.bat))
```
iwr 'https://rebrand.ly/tweaks' | iex
```

to remove edge run this command
```
iwr 'https://rebrand.ly/removeedge' | iex
```

to enable only security updates for 23H2 run this command
```
iwr 'https://rebrand.ly/23H2' | iex
```

to enable only security updates for 24H2 run this command
```
iwr 'https://rebrand.ly/24H2' | iex
```

credits to dave Kirkwood (heytulsiprasad no github) for the [removing edge script](https://gist.github.com/heytulsiprasad/670b7451a1931cfd354c4813c74ac181)
