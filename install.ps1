$profile_base=Split-Path (Split-Path $PROFILE)
$profile1="$profile_base\PowerShell\Microsoft.PowerShell_profile.ps1"
$profile2="$profile_base\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$profile_link = "$PSScriptRoot\Microsoft.PowerShell_profile.ps1"
echo $profile_base
echo $PSScriptRoot

git submodule update --init
if (!
    #current role
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    #is admin?
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    #elevate script and exit current non-elevated runtime
    Start-Process `
        -FilePath 'pwsh' `
        -ArgumentList (
            #flatten to single array
            '-File', $MyInvocation.MyCommand.Source, $args `
            | %{ $_ }
        ) `
        -Verb RunAs
      exit
}

function Create-Link {
	Param (
		[String]$Source,
		[String]$Dest
	)

	echo "Link $Source -> $Dest"
	if (Test-Path $Source) {
		$item=(get-item $Source)
		if ($item.LinkType -eq "SymbolicLink" -and $item.LinkTarget -eq $Dest) {
			echo "No Action"
		} else  {
			echo "File exists, but needs to be updated"
			Remove-Item -Force $Source
			New-Item -Path $Source -ItemType SymbolicLink -Value $Dest
		}
	} else {
		echo "File does not exist, and needs to be created"
		New-Item -Path $Source -ItemType SymbolicLink -Value $Dest
	}
}

Create-Link -Source $profile1 -Dest $profile_link
Create-Link -Source $profile2 -Dest $profile_link
Create-Link -Source ~\.gitconfig -Dest "$PSScriptRoot\gitconfig"
Create-Link -Source ~\.omp.json -Dest "$PSScriptRoot\omp.json"
Create-Link -Source ~\.vimrc -Dest "$PSScriptRoot\vimrc"
Create-Link -Source ~\.vim -Dest "$PSScriptRoot\vim"
$null >> ~\.gitconfig_local

echo "Press any key to exit."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
