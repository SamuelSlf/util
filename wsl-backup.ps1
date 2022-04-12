Write-Host "Starting backup process at $(Get-Date)"

$baseBackupDir = "$HOME\wsl-backup"
$today = Get-Date -Format "yyyyMMdd"
$backupFile = "$baseBackupDir\ubuntu-backup-$today.tar"

wsl --export Ubuntu-20.04 $backupFile

Write-Host "Backup completed at $(Get-Date)"

[string[]]$filesToRemove = Get-ChildItem $baseBackupDir | Sort-Object -Descending -Property LastWriteTime | select -Skip 2

if ( $filesToRemove.Count -gt 0 )
{
    # Keep only the two most recent backups.
	Write-Host "Removing files."
	Get-ChildItem $baseBackupDir | Sort-Object -Descending -Property LastWriteTime | select -Skip 2 | Remove-Item
}
else
{
	Write-Host "There is no file to remove."
}

Write-Host "Done at $(Get-Date)"
