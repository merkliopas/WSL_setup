$url = 'https://sourceforge.net/projects/vcxsrv/files/latest/download'

$output = "$PSScriptRoot\xserver.exe"
$start_time = Get-Date
Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
Write-Output "Download time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

$start_time = Get-Date
Start-Process -FilePath $output -ArgumentList '/S', '/v', '/qn' -wait
Write-Output "Installation time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

Write-Output "Closing in 10 seconds"
Start-Sleep -s 10

Remove-Item -path $output