# & cls & powershell -Command "Invoke-Command -ScriptBlock ([ScriptBlock]::Create(((Get-Content """%0""") -join """`n""")))" & exit
# The above line makes the script executable when renamed .cmd or .bat

# Author: Anton Pusch (Stud-IT) 
# Last update: 2020-11-23

# All data is saved to a user folder in the root directory
$folder = $PWD.Drive.Root + $env:username

# Create folder if necessary and open it
if (Test-Path -Path $folder) {
    Write-Host "Using directory $folder`n"
} else {
    Write-Host "Create directory $folder`n"
    New-Item -ItemType Directory -Path $folder | Out-Null
}
Set-location -Path $folder

function Copy-ItemUsingExplorer{
    param(
        [string]$Path,
        [string]$Destination,
        [int]$CopyFlags
    )

    $objShell = New-Object -ComObject 'Shell.Application'    
    $objFolder = $objShell.NameSpace((gi $Destination).FullName)
    $objFolder.CopyHere((gi $Path).FullName,$CopyFlags.ToString('{0:x}'))
}

$Input = @()
$Input += (
    @("Desktop", "Documents", "Downloads", "Favorites", "Music", "Pictures") `
        | Foreach {"$env:USERPROFILE\$_"}
)
$Input += (
    @("Microsoft\Signatures", "Microsoft\Windows\Themes\CachedFiles", "Microsoft\Windows\Network Shortcuts") `
        | Foreach {"$env:APPDATA\$_"}
)
$Input += (
    @("notes\data", "SAP\PRD_MobileInfrastructure") `
        | Foreach {"$env:ProgramFiles(x86)\$_"}
)

# Export all input folders unless they are empty
foreach ($item in $Input) {
    if (Test-Path -Path "$item\*") {
        Write-Host -Object "Copying $item"
        Copy-ItemUsingExplorer -Path $item -Destination .
    } else {
        Write-Host -Object "Skipped $item since it's empty."
    }
}

# Open destination folder
Invoke-Item -Path $Folder

# Keep console window open
Read-Host -Prompt "`nFinished! Press Enter to quit"