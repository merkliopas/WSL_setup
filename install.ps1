$url = 'https://sourceforge.net/projects/vcxsrv/files/latest/download'

$output = "$PSScriptRoot\xserver.exe"
$start_time = Get-Date
Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
Write-Output "Download time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

$start_time = Get-Date
Start-Process -FilePath $output -ArgumentList '/S', '/v', '/qn' -wait
Write-Output "Installation time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

Remove-Item -path $output

Write-Output "Creating shortcut for terminator"
copy $PSScriptRoot\icon\terminator.ico "C:\Users\$env:UserName\AppData"
copy $PSScriptRoot\system\StartTerminator.vbs "C:\Users\$env:UserName\AppData"

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Terminator.lnk")
$Shortcut.TargetPath =  "C:\Windows\System32\wscript.exe"
$Shortcut.Arguments = "C:\Users\$env:UserName\AppData\StartTerminator.vbs"
$Shortcut.IconLocation = "C:\Users\$env:UserName\AppData\terminator.ico"
$Shortcut.WorkingDirectory = "%USERPROFILE%"
$Shortcut.Save()

Write-Output "Creating startup job to run x-server"
copy $PSScriptRoot\system\StartXserver.bat "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

Write-Output "Closing in 10 seconds"
Start-Sleep -s 10


