#===============================================================================
# -- PowerShell functions ------------------------------------------------------
#===============================================================================

# Basic commands
function which {
    param (
        [Parameter(Mandatory=$true)]
        [string]$name
    )
    Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition
}

function touch {
    param (
        [Parameter(Mandatory=$true)]
        [string]$file
    )
    "" | Out-File $file -Encoding ASCII
}

# Common Editing needs
function Edit-Hosts {
    Invoke-Expression "sudo $(if($env:EDITOR -ne $null) {$env:EDITOR} else {'notepad'}) $env:windir\system32\drivers\etc\hosts"
}

function Edit-Profile {
    Invoke-Expression "$(if($env:EDITOR -ne $null) {$env:EDITOR} else {'notepad'}) $profile"
}

# Sudo
function sudo {
    if ($args.Length -eq 1) {
        start-process $args[0] -verb "runAs"
    }
    if ($args.Length -gt 1) {
        start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
    }
}

# Update Windows Store apps. This doesn't get all, but gets most.
function Update-WindowsStore {
    Get-CimInstance -Namespace "Root\cimv2\mdm\dmmap" -ClassName "MDM_EnterpriseModernAppManagement_AppManagement01" | Invoke-CimMethod -MethodName UpdateScanMethod
}

# System Update - Update RubyGems, NPM, and their installed packages
function System-Update {
    Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll
    Update-WindowsStore
    winget upgrade --all
    Update-Module
    Update-Help -Force
    if ((which gem)) {
        gem update --system
        gem update
    }
    if ((which npm)) {
        npm install npm -g
        npm update -g
    }
}

# Reload the Shell
function Reload-Powershell {
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell"
    $newProcess.Arguments = "-nologo"
    [System.Diagnostics.Process]::Start($newProcess)
    exit
}

# Download a file into a temporary folder
function curlex {
    param (
        [Parameter(Mandatory=$true)]
        [string]$url
    )
    $uri = New-Object System.Uri $url
    $filename = $uri.Segments | Select-Object -Last 1
    $path = Join-Path $env:Temp $filename
    if (Test-Path $path) {
        Remove-Item $path -Force
    }

    (New-Object Net.WebClient).DownloadFile($url, $path)

    return New-Object IO.FileInfo $path
}

# Empty the Recycle Bin on all drives
function Empty-RecycleBin {
    $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
    $RecBin.Items() | ForEach-Object {
        Remove-Item $_.Path -Recurse -Confirm:$false
    }
}

# Sound Volume
function Get-SoundVolume {
    <#
    .SYNOPSIS
    Get audio output volume.

    .DESCRIPTION
    The Get-SoundVolume cmdlet gets the current master volume of the default audio output device. The returned value is an integer between 0 and 100.

    .LINK
    Set-SoundVolume

    .LINK
    Set-SoundMute

    .LINK
    Set-SoundUnmute

    .LINK
    https://github.com/jayharris/dotfiles-windows/
    #>
    [math]::Round([Audio]::Volume * 100)
}

function Set-SoundVolume {
    <#
    .SYNOPSIS
    Set audio output volume.

    .DESCRIPTION
    The Set-SoundVolume cmdlet sets the current master volume of the default audio output device to a value between 0 and 100.

    .PARAMETER Volume
    An integer between 0 and 100.

    .EXAMPLE
    Set-SoundVolume 65
    Sets the master volume to 65%.

    .EXAMPLE
    Set-SoundVolume -Volume 100
    Sets the master volume to a maximum 100%.

    .LINK
    Get-SoundVolume

    .LINK
    Set-SoundMute

    .LINK
    Set-SoundUnmute

    .LINK
    https://github.com/jayharris/dotfiles-windows/
    #>
    param (
        [Parameter(Mandatory=$true)]
        [Int32]$Volume
    )
    [Audio]::Volume = ($Volume / 100)
}

function Set-SoundMute {
    <#
    .SYNOPSIS
    Mute audio output.

    .DESCRIPTION
    The Set-SoundMute cmdlet mutes the default audio output device.

    .LINK
    Get-SoundVolume

    .LINK
    Set-SoundVolume

    .LINK
    Set-SoundUnmute

    .LINK
    https://github.com/jayharris/dotfiles-windows/
    #>
    [Audio]::Mute = $true
}

function Set-SoundUnmute {
    <#
    .SYNOPSIS
    Unmute audio output.

    .DESCRIPTION
    The Set-SoundUnmute cmdlet unmutes the default audio output device.

    .LINK
    Get-SoundVolume

    .LINK
    Set-SoundVolume

    .LINK
    Set-SoundMute

    .LINK
    https://github.com/jayharris/dotfiles-windows/
    #>
    [Audio]::Mute = $false
}

### File System functions
### ----------------------------
# Create a new directory and enter it
function CreateAndSet-Directory {
    param (
        [Parameter(Mandatory=$true)]
        [String]$path
    )
    New-Item $path -ItemType Directory -ErrorAction SilentlyContinue
    Set-Location $path
}

# Determine size of a file or total size of a directory
function Get-DiskUsage {
    param (
        [string]$path = (Get-Location).Path
    )
    Convert-ToDiskSize ((Get-ChildItem .\ -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum) 1
}

# Cleanup all disks (Based on Registry Settings in `windows.ps1`)
function Clean-Disks {
    Start-Process "$(Join-Path $env:WinDir 'system32\cleanmgr.exe')" -ArgumentList "/sagerun:6174" -Verb "runAs"
}

### Environment functions
### ----------------------------

# Reload the $env object from the registry
function Refresh-Environment {
    $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
                 'HKCU:\Environment'

    $locations | ForEach-Object {
        $k = Get-Item $_
        $k.GetValueNames() | ForEach-Object {
            $name  = $_
            $value = $k.GetValue($_)
            Set-Item -Path Env:\$name -Value $value
        }
    }

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

# Set a permanent Environment variable, and reload it into $env
function Set-Environment {
    param (
        [Parameter(Mandatory=$true)]
        [String]$variable,

        [Parameter(Mandatory=$true)]
        [String]$value
    )
    Set-ItemProperty "HKCU:\Environment" $variable $value
    Invoke-Expression "`$env:${variable} = `"$value`""
}

# Add a folder to $env:Path
function Prepend-EnvPath {
    param (
        [Parameter(Mandatory=$true)]
        [String]$path
    )
    $env:PATH = $env:PATH + ";$path"
}

function Prepend-EnvPathIfExists {
    param (
        [Parameter(Mandatory=$true)]
        [String]$path
    )
    if (Test-Path $path) {
        Prepend-EnvPath $path
    }
}

function Append-EnvPath {
    param (
        [Parameter(Mandatory=$true)]
        [String]$path
    )
    $env:PATH = $env:PATH + ";$path"
}

function Append-EnvPathIfExists {
    param (
        [Parameter(Mandatory=$true)]
        [String]$path
    )
    if (Test-Path $path) {
        Append-EnvPath $path
    }
}

### Utilities
### ----------------------------

# Convert a number to a disk size (12.4K or

        [ValidateNotNullOrEmpty()]
        [string]$Destination = (Get-Location).Path
    )

    $filePath = Resolve-Path $File
    $destinationPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)

    if (($PSVersionTable.PSVersion.Major -ge 3) -and
       ((Get-ItemProperty -Path "HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full" -ErrorAction SilentlyContinue).Version -like "4.5*" -or
       (Get-ItemProperty -Path "HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Client" -ErrorAction SilentlyContinue).Version -like "4.5*")) {

        try {
            [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
            [System.IO.Compression.ZipFile]::ExtractToDirectory("$filePath", "$destinationPath")
        } catch {
            Write-Warning -Message "Unexpected Error. Error details: $_.Exception.Message"
        }
    } else {
        try {
            $shell = New-Object -ComObject Shell.Application
            $shell.Namespace($destinationPath).copyhere(($shell.NameSpace($filePath)).items())
        } catch {
            Write-Warning -Message "Unexpected Error. Error details: $_.Exception.Message"
        }
    }
}
P