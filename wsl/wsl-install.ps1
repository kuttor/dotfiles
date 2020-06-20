# enablee Windows Subsystem for Linux feature
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Enablee Virtual Machine Platfomr
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Set WSL 2 as default
wsl --set-default-version 2
