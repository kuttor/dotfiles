#!/ powershell

# ==============================================================================
# -- microsoft.powershell ------------------------------------------------------
# ==============================================================================

Push-Location (Split-Path -parent $profile) `
        "components","functions","aliases","exports","extra" `
    | Where-Object {Test-Path "$_.ps1"} `
    | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"} `
Pop-Location


# # Define the base directory where the scripts are located
# $baseDirectory = Split-Path -Parent $profile

# # Define the names of the scripts to source
# $scriptNames = @("components.ps1", "functions.ps1", "aliases.ps1", "exports.ps1", "extra.ps1")

# # Iterate over each script name
# foreach ($scriptName in $scriptNames) {
#     # Construct the full path of the script
#     $scriptPath = Join-Path -Path $baseDirectory -ChildPath $scriptName

#     # Check if the script exists
#     if (Test-Path $scriptPath) {
#         # Source the script
#         . $scriptPath
#     } else {
#         # Optionally, notify that the script was not found
#         Write-Warning "Script not found: $scriptPath"
#     }
# }X