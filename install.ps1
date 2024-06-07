$profile_base=Split-Path (Split-Path $PROFILE)
$profile1="$profile_base\PowerShell\Microsoft.PowerShell_profile.ps1"
$profile2="$profile_base\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$profile_link = "$PSScriptRoot\Microsoft.PowerShell_profile.ps1"
echo $profile_base
echo $PSScriptRoot

function Create-Link {
	Param (
		[String]$Source,
		[String]$Dest
	)

	echo "Link $Source -> $Dest"
	if (Test-Path $Source -PathType Leaf) { 
		$item=(get-item $Source)
		if ($item.LinkType -eq "SymbolicLink" -and $item.LinkTarget -eq $Dest) {
			echo "No Action"
			#TODO check link location
		} else  {
			echo "File exists, but needs to be updated"
			Remove-Item -Force $Source
			New-Item -Path $Source -ItemType SymbolicLink -Value $Dest
		}
	} else {
		New-Item -Path $Source -ItemType SymbolicLink -Value $Dest
	}
}

Create-Link -Source $profile1 -Dest $profile_link
Create-Link -Source $profile2 -Dest $profile_link
Create-Link -Source ~\.gitconfig -Dest "$PSScriptRoot\gitconfig"
Create-Link -Source ~\.omp.json -Dest "$PSScriptRoot\omp.json"
#touch ~\.gitconfig_local
