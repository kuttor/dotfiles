function Open-VMRC()
{

<#
.SYNOPSIS
	Launch a VMRC console for a specified VM on PowerShell Core
.DESCRIPTION
	The Open-VMConsoleWindow is not supported on PowerShell Core, this Open-VMRC function will launch a VMRC console for a given VM on PowerShell Core.
.PARAMETER VM
    Name of the Virtual Machine VMRC will launch
.INPUTS
	VM Objects
.OUTPUTS
	None
.EXAMPLE
	Get-VM test01 | Open-VMRC
.EXAMPLE
	Open-VMRC test01
.NOTES
	Author:			Ezra Hill
	Website: 		http://ezrahill.co.uk
	Twitter: 		@ezrahill
	Version:        1.0
	Creation Date:  28/6/2019
	Purpose/Change: Initial script
#>


    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipeline=$True)] $vm
    )

    $vcsa = $global:DefaultVIServer.Name

    # Checking if an object or a string was passed through
    if ($vm.GetType().Name -eq "String")
    {
        $vm = Get-VM $vm
    }

    # Get the MoRef ID for the VM
    $vmID = $vm.id.Split("-")[-1]

    # Generate the URL for and ESXi Host or a vCenter server
    if ($vm.id -like "*vm*")
    {
        $url = "vmrc://" + $creds.username + "@" + $vcsa + ":443/?moid=vm-" + $vmID
    }
    else
    {
        $url = "vmrc://" + $creds.username + "@" + $vcsa + ":443/?moid=" + $vmID
    }

    Start-Process -Path $url
}