Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Panos0210/DesktopOS/refs/heads/main/Batch%20FIles/Enable%20Only%20Security%20Updates%20(23H2).bat' -OutFile "$env:TEMP\23H2.bat"; Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"& `"$env:TEMP\23H2.bat`"" -Verb RunAs 
