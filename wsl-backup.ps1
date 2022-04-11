Write-Host "Starting backup process at $(Get-Date)"

$baseDir = "$HOME\wsl-backup\"
$today = Get-Date -Format "yyyyMMdd"
$backupFile = "$baseDir\ubuntu-backup-$today.tar"
wsl --export Ubuntu-20.04 $backupFile

Write-Host "Backup completed at $(Get-Date)"

Write-Host "Removing $(Get-ChildItem $baseDir | Sort-Object -Descending -Property LastWriteTime | select -Skip 2)"
Get-ChildItem $baseDir | Sort-Object -Descending -Property LastWriteTime | select -Skip 2 | Remove-Item -Force

Write-Host "Done at $(Get-Date)"