Write-Host -NoNewLine "Grabbing environmental variables..."
$file = Get-Content -path .env
Write-Host " done"
$username = $file[0].split("=")[1]
$password = ConvertTo-SecureString $file[1].split("=")[1] -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $password)
Write-Host -NoNewLine "Creating SSH session..."
$session = New-SSHSession -ComputerName $file[2].split("=")[1] -Credential $psCred
Write-Host "done"
Write-Host -NoNewLine "Preparing files for transfer..."
Get-ChildItem -Path .\backend\ -Exclude node_modules | Compress-Archive -DestinationPath $file[4].split("=")[1] -Force
Write-Host "done"
Write-Host -NoNewLine "Transferring files to server..."
Set-SCPItem -computername $file[2].split("=")[1] -Credential $psCred $file[4].split("=")[1]  -Destination $file[8].split("=")[1]
Write-Host "done"
$stream = $session.Session.CreateShellStream("PS-SSH", 0, 0, 0, 0, 100)
Write-Host -NoNewLine "Requesting superuser permissions..."
$result = Invoke-SSHStreamExpectSecureAction -ShellStream $stream -Command "sudo su -" -ExpectString "[sudo] password for $($username):" -SecureAction $password
if ($result -eq "False") {
    $result = Invoke-SSHStreamExpectSecureAction -ShellStream $stream -Command "sudo su -" -ExpectString "[sudo] password di $($username):" -SecureAction $password
}
Write-Host "done"
#$sReturn = $stream.Read()
Write-Host -NoNewLine "Changing file ownership..."
$stream.WriteLine("chown root:root " + $file[6].split("=")[1])
Write-Host "done"
#sleep -s 2
#$sReturn = $stream.Read()
Write-Host -NoNewLine "Unzipping files..."
$stream.WriteLine("unzip -o " + $file[6].split("=")[1] + " -d " + $file[10].split("=")[1])
Write-Host "done"
#sleep -s 2
#$sReturn = $stream.Read()
Write-Host -NoNewLine "Cleaning up files..."
$stream.WriteLine("rm -rf " + $file[6].split("=")[1])
Write-Host "done"
#sleep -s 2
#$sReturn = $stream.Read()
Write-Host -NoNewLine "Changing directory..."
$stream.WriteLine("cd " + $file[10].split("=")[1])
Write-Host "done"
#sleep -s 2
#$sReturn = $stream.Read()
Write-Host -NoNewLine "Run NPM install..."
$stream.WriteLine("npm install")
Write-Host "done"
#sleep -s 2
#$sReturn = $stream.Read()
Write-Host -NoNewLine "Restart PM2 processes..."
$stream.WriteLine("pm2 restart " + $file[12].split("=")[1])
Write-Host "done"
#sleep -s 2
#$sReturn = $stream.Read()