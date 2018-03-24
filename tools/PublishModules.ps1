# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#

.SYNOPSIS Create nuget packages for each module.

.PARAMETER IsNetCore
If built using .NET core.

.PARAMETER BuildConfig
Either Debug or Release.

.PARAMETER Scope
Either a specific module or a class of modules.

.PARAMETER ApiKey
ApiKey used to publish nuget to PS repository.

.PARAMETER RepositoryLocation
Location we want to publish too.

.PARAMETER NugetExe
Path to the nuget executable.

.PARAMETER Profile
Either Latest or Stack.

#>

param(
    [Parameter(Mandatory = $false, Position = 0)]
    [switch]$IsNetCore,
    [Parameter(Mandatory = $false, Position = 1)]
    [ValidateSet("Debug", "Release")]
    [string]$BuildConfig,
    [Parameter(Mandatory = $false, Position = 2)]
    [string]$Scope = 'All',
    [Parameter(Mandatory = $false, Position = 3)]
    [string]$ApiKey,
    [Parameter(Mandatory = $false, Position = 4)]
    [string]$RepositoryLocation,
    [Parameter(Mandatory = $false, Position = 5)]
    [string]$NugetExe,
    [Parameter(Mandatory = $false)]
    [ValidateSet("Latest", "Stack")]
    [string]$Profile = "Latest"
)

<#################################################
#
#               Helper functions
#
#################################################>

<#
.SYNOPSIS Write out to a file using UTF-8 without BOM.

.PARAMETER File
The file to write the contents too.

.PARAMETER Text
The new file contents.

#>
function Out-FileNoBom {
    param(
        [System.string]$File,
        [System.string]$Text
    )
    $encoding = New-Object System.Text.UTF8Encoding $False
    [System.IO.File]::WriteAllLines($File, $Text, $encoding)
}

<#
.SYNOPSIS Get the Package and build Output directory.

.PARAMETER BuildConfig
Either debug or release.

.PARAMETER Profile
Either Latest or Stack.

.PARAMETER IsNetCore
If built using .NET core.

#>
function Get-Directories {
    [CmdletBinding()]
    param
    (
        [String]$BuildConfig,
        [String]$Profile,
        [switch]$IsNetCore
    )

    PROCESS {
        $packageFolder = "$PSScriptRoot\..\src\Package"
        if ($Profile -eq "Stack") {
            $packageFolder = "$PSScriptRoot\..\src\Stack"
        }

        if ($isNetCore) {
            $resourceManagerRootFolder = "$packageFolder\$buildConfig\ResourceManager"
        } else {
            $resourceManagerRootFolder = "$packageFolder\$buildConfig\ResourceManager\AzureResourceManager"
        }
        Write-Output -InputObject $packageFolder, $resourceManagerRootFolder
    }
}

<#################################################
#
#               Get module functions
#
#################################################>

<#
.SYNOPSIS Get the list of rollup modules.  Currently AzureRM, for Stack and Azure, or AzureStack.

.PARAMETER BuildConfig
Either debug or release.

.PARAMETER SCOPE
All, AzureRM, and Stack are valid Rollup modules.

.PARAMETER IsNetCore
If built using .NET core.

#>
function Get-RollupModules {
    [CmdletBinding()]
    param
    (
        [string]$BuildConfig,
        [string]$Profile,
        [string]$Scope,
        [switch]$IsNetCore
    )

    PROCESS {
        $targets = @()

        if (($Scope -eq 'All') -or ($Scope -eq 'AzureRM') -or ($Scope -eq 'Stack')) {

            $packageFolder, $resourceManagerRootFolder = Get-Directories -BuildConfig $BuildConfig -Profile $Profile -IsNetCore:$IsNetCore

            if ($Profile -eq "Stack") {
                $targets += "$PSScriptRoot\..\src\StackAdmin\AzureRM"
                $targets += "$PSScriptRoot\..\src\StackAdmin\AzureStack"
            }

            if ($IsNetCore) {
                # For .NetCore publish AzureRM.Netcore
                $targets += "$PSScriptRoot\AzureRM.Netcore"
            }
        }
        Write-Output -InputObject $targets
    }
}

<#
.SYNOPSIS Find and return all AzureStack admin modules.

.PARAMETER BuildConfig
Either debug or release.

.PARAMETER Profile
Either Latest or Stack.

.PARAMETER Scope
The Module or class of Modules to build.

.PARAMETER IsNetCore
If we built using .NET core.

#>
function Get-AdminModules {
    [CmdletBinding()]
    param
    (
        [string]$BuildConfig,
        [string]$Profile,
        [string]$Scope,
        [switch]$IsNetCore
    )

    PROCESS {
        $targets = @()
        if (($Scope -eq 'All') -or ($Scope -eq "Stack")) {
            $packageFolder, $resourceManagerRootFolder = Get-Directories -BuildConfig $BuildConfig -Profile $Profile -IsNetCore:$IsNetCore

            $resourceManagerModules = Get-ChildItem -Path $resourceManagerRootFolder -Directory -Filter Azs.*
            foreach ($module in $resourceManagerModules) {
                $targets += $module.FullName
            }
        }
        Write-Output -InputObject $targets
    }
}

<#

.SYNOPSIS Get the list of Azure modules.

.PARAMETER BuildConfig
Either release or debug.

.PARAMETER Profile
Either Latest or Stack

.PARAMETER Scope
The scope, either a specific Module or class of modules.

.PARAMETER PublishLocal
If publishing locally only.

.PARAMETER IsNetCore
If built with .NET core.

#>
function Get-ClientModules {
    [CmdletBinding()]
    param
    (
        [string]$BuildConfig,
        [string]$Profile,
        [string]$Scope,
        [bool]$PublishLocal,
        [switch]$IsNetCore
    )

    PROCESS {
        $targets = @()

        $packageFolder, $resourceManagerRootFolder = Get-Directories -BuildConfig $BuildConfig -Profile $Profile -IsNetCore:$IsNetCore

        # Everyone but Storage
        if ($Scope -eq 'All' -or $PublishLocal -or $Profile -eq "Stack") {
            if ($IsNetCore) {
                $targets += "$resourceManagerRootFolder\AzureRM.Profile.Netcore"
            } else {
                $targets += "$resourceManagerRootFolder\AzureRM.Profile"
            }
        }

        # Azure non-resource modules not using NetCore
        if (-not $IsNetCore) {

            if (($Scope -eq 'All') -or ($Scope -eq 'AzureStorage')) {
                $targets += "$packageFolder\$buildConfig\Storage\Azure.Storage"
            }

            if ((($Scope -eq 'All') -or ($Scope -eq 'ServiceManagement')) -and ($Profile -ne "Stack")) {
                $targets += "$packageFolder\$buildConfig\ServiceManagement\Azure"
            }
        }

        # Get all module directories
        $resourceManagerModules = Get-ChildItem -Path $resourceManagerRootFolder -Directory -Exclude Azs.*

        # We should ignore these, they are handled separatly.
        $excludedModules = @('AzureRM.Profile', 'Azure.Storage', 'AzureRM.Profile.Netcore')

        # Get the list of targets
        if ($Scope -eq 'All' -or $Scope -eq 'Stack') {
            # Add all modules for AzureRM for Azure
            foreach ($module in $resourceManagerModules) {
                # AzureRM.Profile already added, Azure.Storage built from test dependencies
                if (-not ($module.Name -in $excludedModules)) {
                    $targets += $module.FullName
                }
            }
        } elseif (($Scope -ne 'AzureRM') -and ($Scope -ne "ServiceManagement") -and ($Scope -ne "AzureStorage") -and ($Scope -ne "Stack")) {
            # Handle specific modules.  i.e AzureRM.KeyVault
            $modulePath = Join-Path $resourceManagerRootFolder "AzureRM.$Scope"
            if (Test-Path $modulePath) {
                $targets += $modulePath
            } else {
                Write-Error "Can not find module with name $Scope to publish"
            }
        }
        Write-Output -InputObject $targets
    }
}

<#
.SYNOPSIS Get the modules to publish.

.PARAMETER BuildConfig
The build configuration, either Release or Debug

.PARAMETER Scope
The module scope, either All, Storage, or Stack.

.PARAMETER PublishToLocal
$true if publishing locally only, $false otherwise

.PARAMETER Profile
Either Latest or Stack

.PARAMETER IsNetCore
If the modules are built using Net Core.

#>
function Get-AllModules {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String]$BuildConfig,

        [ValidateNotNullOrEmpty()]
        [String]$Scope,

        [switch]$PublishLocal,

        [ValidateNotNullOrEmpty()]
        [String]$Profile,

        [switch]$IsNetCore
    )

    Write-Host "Getting client modules"
    $clientModules = Get-ClientModules -BuildConfig $BuildConfig -Profile $Profile -Scope $Scope -PublishLocal:$PublishLocal -IsNetCore:$isNetCore
    Write-Host " "

    Write-Host "Getting admin modules"
    $adminModules = Get-AdminModules -BuildConfig $BuildConfig -Profile $Profile -Scope $Scope -IsNetCore:$isNetCore
    Write-Host " "

    Write-Host "Getting rollup modules"
    $rollupModules = Get-RollupModules -BuildConfig $BuildConfig -Profile $Profile -Scope $Scope -IsNetCore:$isNetCore
    Write-Host " "

    return @{
        ClientModules = $clientModules;
        AdminModules  = $adminModules;
        RollUpModules = $rollUpModules
    }
}

<#################################################
#
#       Create and update nuget functions.
#
#################################################>

<#
.SYNOPSIS Overwrite the Author,CompanyName and Copyright to be Microsoft.

.PARAMETER Path
Path to the psd1 file.

#>
function Set-CopyrightInfo {

    [CmdletBinding()]
    param(
        [string]$Path
    )
    Update-ModuleManifest -Path $Path -Author "Microsoft" -Copyright "Microsoft @$(Get-Date -Format yyyy)" -CompanyName "Microsoft"
}

<#
.SYNOPSIS Remove the RequiredModules and NestedModules psd1 properties with empty array.

.PARAMETER Path
Path to the psd1 file.

#>
function Remove-ModuleDependencies {
    [CmdletBinding()]
    param(
        [string]$Path
    )

    PROCESS {
        $regex = New-Object System.Text.RegularExpressions.Regex "RequiredModules\s*=\s*@\([^\)]+\)"
        $content = (Get-Content -Path $Path) -join "`r`n"
        $text = $regex.Replace($content, "RequiredModules = @()")
        Out-FileNoBom -File $Path -Text $text

        $regex = New-Object System.Text.RegularExpressions.Regex "NestedModules\s*=\s*@\([^\)]+\)"
        $content = (Get-Content -Path $Path) -join "`r`n"
        $text = $regex.Replace($content, "NestedModules = @()")
        $text | Out-File -FilePath $Path
        Out-FileNoBom -File $Path -Text $text
    }
}

<#
.SYNOPSIS Update license acceptance to be required.

.PARAMETER TempRepoPath
Path to the local temporary repository.

.PARAMETER ModuleName
Name of the module to update.

.PARAMETER DirPath
Path to the directory holding the modules to update.

.PARAMETER NugetExe
Path to the Nuget executable.
#>
function Update-NugetPackage {
    [CmdletBinding()]
    param(
        [string]$BasePath,
        [string]$ModuleName,
        [string]$DirPath,
        [string]$NugetExe
    )

    PROCESS {
        $regex2 = "<requireLicenseAcceptance>false</requireLicenseAcceptance>"

        $relDir = Join-Path $DirPath -ChildPath "_rels"
        $contentPath = Join-Path $DirPath -ChildPath '`[Content_Types`].xml'
        $packPath = Join-Path $DirPath -ChildPath "package"
        $modulePath = Join-Path $DirPath -ChildPath ($ModuleName + ".nuspec")

        # Cleanup
        Remove-Item -Recurse -Path $relDir -Force
        Remove-Item -Recurse -Path $packPath -Force
        Remove-Item -Path $contentPath -Force

        # Create new output
        $content = (Get-Content -Path $modulePath) -join "`r`n"
        $content = $content -replace $regex2, ("<requireLicenseAcceptance>true</requireLicenseAcceptance>")
        Out-FileNoBom -File (Join-Path (Get-Location) $modulePath) -Text $content

        &$NugetExe pack $modulePath -OutputDirectory $TempRepoPath
    }
}

<#
.SYNOPSIS Add given modules to local repository.

.PARAMETER ModulePaths
List of paths to modules.

.PARAMETER TempRepo
Name of local temporary repository.

.PARAMETER TempRepoPath
path to local temporary repository.

.PARAMETER NugetExe
Path to nuget executable.

#>
function Add-Modules {
    [CmdletBinding()]
    param(
        [String[]]$ModulePaths,

        [ValidateNotNullOrEmpty()]
        [String]$TempRepo,

        [ValidateNotNullOrEmpty()]
        [String]$TempRepoPath,

        [ValidateNotNullOrEmpty()]
        [String]$NugetExe
    )
    PROCESS {
        foreach ($modulePath in $ModulePaths) {
            Write-Output $modulePath
            $module = Get-Item -Path $modulePath
            Write-Output "Updating $module module from $modulePath"
            Add-Module -Path $modulePath -TempRepo $TempRepo -TempRepoPath $TempRepoPath -NugetExe $NugetExe
            Write-Output "Updated $module module"
        }
    }
}

<#
.SYNOPSIS Add all modules to local repo.

.PARAMETER ModulePaths
A hash table of Modules types and paths.

.PARAMETER TempRepo
The name of the temporary repository.

.PARAMETER TempRepoPath
Path to the temporary reposityroy.

.PARAMETER NugetExe
Location of nuget executable.

#>
function Add-AllModules {
    [CmdletBinding()]
    param(
        $ModulePaths,

        [ValidateNotNullOrEmpty()]
        [String]$TempRepo,

        [ValidateNotNullOrEmpty()]
        [String]$TempRepoPath,

        [ValidateNotNullOrEmpty()]
        [String]$NugetExe
    )

    $Keys = @('ClientModules', 'AdminModules', 'RollupModules')
    Write-Output "adding modules to local repo"
    foreach ($module in $Keys) {
        $modulePath = $Modules[$module]
        Write-Output "Adding $module modules to local repo"
        Add-Modules -TempRepo $TempRepo -TempRepoPath $TempRepoPath -ModulePath $modulePath -NugetExe $NugetExe
        Write-Output " "
    }
    Write-Output " "
}

<#################################################
#
#           Publish module functions.
#
#################################################>


<#

.SYNOPSIS Publish module to local temporary repository.  If no RootModule found create and add new psm1.

.PARAMETER Path
Path to the local module.

.PARAMETER TempRepo
Name of the local temporary repository.

.PARAMETER TempRepoPath
Path to the local temporary repository.

.PARAMETER NugetExe
Path to nuget exectuable.

#>
function Add-Module {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [string]$Path,

        [ValidateNotNullOrEmpty()]
        [string]$TempRepo,

        [ValidateNotNullOrEmpty()]
        [string]$TempRepoPath,

        [ValidateNotNullOrEmpty()]
        [string]$NugetExe
    )

    PROCESS {

        $moduleName = (Get-Item -Path $Path).Name
        $moduleManifest = $moduleName + ".psd1"
        $moduleSourcePath = Join-Path -Path $Path -ChildPath $moduleManifest
        $file = Get-Item $moduleSourcePath
        Import-LocalizedData -BindingVariable ModuleMetadata -BaseDirectory $file.DirectoryName -FileName $file.Name -ErrorAction Stop

        Write-Output "Publishing the module $moduleName"
        Publish-Module -Path $Path -Repository $TempRepo -Force -ErrorAction Stop | Out-Null
        Write-Output "$moduleName published"

        # Create a psm1 and alter psd1 dependencies to allow fine-grained
        # control over assembly loading.  Opt out by definitng a RootModule.
        if ($ModuleMetadata.RootModule) {
            Write-Output "Root module found, done"
            return
        }

        Write-Output "No root module found, creating"

        $moduleVersion = $ModuleMetadata.ModuleVersion.ToString()
        if ($ModuleMetadata.PrivateData.PSData.Prerelease -ne $null) {
            $moduleVersion += ("-" + $ModuleMetadata.PrivateData.PSData.Prerelease -replace "--", "-")
        }

        Write-Output "Changing to local repository directory for module modifications $TempRepoPath"
        Push-Location $TempRepoPath

        try {

            # Paths
            $nupkgPath = Join-Path -Path . -ChildPath ($moduleName + "." + $moduleVersion + ".nupkg")
            $zipPath = Join-Path -Path . -ChildPath ($moduleName + "." + $moduleVersion + ".zip")
            $dirPath = Join-Path -Path . -ChildPath $moduleName
            $unzippedManifest = Join-Path -Path $dirPath -ChildPath ($moduleName + ".psd1")

            # Validate nuget is there
            if (!(Test-Path -Path $nupkgPath)) {
                throw "Module at $nupkgPath in $TempRepoPath does not exist"
            }

            Write-Output "Renaming package $nupkgPath to zip archive $zipPath"
            Rename-Item $nupkgPath $zipPath

            Write-Output "Expanding $zipPath"
            Expand-Archive $zipPath -DestinationPath $dirPath

            Write-Output "Setting copyright information for $unzippedManifest"
            Set-CopyrightInfo -Path $unzippedManifest

            Write-Output "Removing module manifest dependencies for $unzippedManifest"
            Remove-ModuleDependencies -Path (Join-Path $TempRepoPath $unzippedManifest)

            Remove-Item -Path $zipPath -Force

            Write-Output "Repackaging $dirPath"
            Update-NugetPackage -TempRepoPath $TempRepoPath -ModuleName $moduleName -DirPath $dirPath -NugetExe $NugetExe
            Write-Output "Removing temporary folder $dirPath"
            Remove-Item -Recurse $dirPath -Force -ErrorAction Stop
        } finally {
            Pop-Location
        }
    }
}

<#
.SYNOPSIS Publish the module to PS Gallery.

.PARAMETER Path
Path to the module.

.PARAMETER ApiKey
Key used to publish.

.PARAMETER TempRepoPath
Path to the local temporary repository containing nuget.

.PARAMETER RepoLocation
Repository we are publishing too.

.PARAMETER NugetExe
Path to nuget executable.

#>
function Publish-PowershellModule {
    [CmdletBinding()]
    param(
        [string]$Path,
        [string]$ApiKey,
        [string]$TempRepoPath,
        [string]$RepoLocation,
        [string]$NugetExe
    )

    PROCESS {
        $moduleName = (Get-Item -Path $Path).Name
        $moduleManifest = $moduleName + ".psd1"
        $moduleSourcePath = Join-Path -Path $Path -ChildPath $moduleManifest
        $manifest = Test-ModuleManifest -Path $moduleSourcePath
        $nupkgPath = Join-Path -Path $TempRepoPath -ChildPath ($moduleName + "." + $manifest.Version.ToString() + ".nupkg")
        if (!(Test-Path -Path $nupkgPath)) {
            throw "Module at $nupkgPath in $TempRepoPath does not exist"
        }

        Write-Output "Pushing package $moduleName to nuget source $RepoLocation"
        &$NugetExe push $nupkgPath $ApiKey -s $RepoLocation
        Write-Output "Pushed package $moduleName to nuget source $RepoLocation"
    }
}

<#
.SYNOPSIS Publish the nugets to PSGallery

.PARAMETER ApiKey
Key used to publish.

.PARAMETER TempRepoPath
Path to the local temporary repository.

.PARAMETER RepoLocation
Name of repository we are publishing too.

.PARAMETER NugetExe
Path to nuget executable.

.PARAMETER PublishLocal
If publishing locally we don't do anything.

#>
function Publish-AllModules {
    [CmdletBinding()]
    param(
        $ModulePaths,

        [ValidateNotNullOrEmpty()]
        [String]$ApiKey,

        [ValidateNotNullOrEmpty()]
        [String]$TempRepoPath,

        [ValidateNotNullOrEmpty()]
        [String]$RepoLocation,

        [ValidateNotNullOrEmpty()]
        [String]$NugetExe,

        [switch]$PublishLocal
    )
    if (!$PublishLocal) {
        exit 1
        foreach ($module in $ModulePaths.Keys) {
            $paths = $Modules[$module]
            foreach ($modulePath in $paths) {
                $module = Get-Item -Path $modulePath
                Write-Host "Pushing $module module from $modulePath"
                Publish-PowershellModule -Path $modulePath -ApiKey $apiKey -TempRepoPath $TempRepoPath -RepoLocation $RepoLocation -NugetExe $NugetExe
                Write-Host "Pushed $module module"
            }
        }
    }
}

<###################################
#
#           Setup/Execute
#
###################################>


if ([string]::IsNullOrEmpty($buildConfig)) {
    Write-Verbose "Setting build configuration to 'Release'"
    $buildConfig = "Release"
}

if ([string]::IsNullOrEmpty($repositoryLocation)) {
    Write-Verbose "Setting repository location to 'https://dtlgalleryint.cloudapp.net/api/v2'"
    $repositoryLocation = "https://dtlgalleryint.cloudapp.net/api/v2"
}

if ([string]::IsNullOrEmpty($Scope)) {
    Write-Verbose "Default scope to all"
    $Scope = 'All'
}

if ([string]::IsNullOrEmpty($nugetExe)) {
    Write-Verbose "Use default nuget path"
    $nugetExe = "$PSScriptRoot\nuget.exe"
}

Write-Host "Publishing $Scope package (and its dependencies)"
Get-PackageProvider -Name NuGet -Force

# NOTE: Can only be Azure or Azure Stack, not both.
$packageFolder = "$PSScriptRoot\..\src\Package"
if ($Profile -eq "Stack") {
    $packageFolder = "$PSScriptRoot\..\src\Stack"
}

# Set temporary repo location
$PublishLocal = test-path $repositoryLocation
[string]$tempRepoPath = "$PSScriptRoot\..\src\Package"
if ($PublishLocal) {
    if ($Profile -eq "Stack") {
        $tempRepoPath = (Join-Path $repositoryLocation -ChildPath "Stack")
    } else {
        $tempRepoPath = (Join-Path $repositoryLocation -ChildPath "Package")
    }
} else {
    Write-Output "Publishing to $repositoryLocation!"
    exit 1
}
Write-Output "Not publishing!"
exit

$tempRepoName = ([System.Guid]::NewGuid()).ToString()
$repo = Get-PSRepository | Where-Object { $_.SourceLocation -eq $tempRepoPath }
if ($repo -ne $null) {
    $tempRepoName = $repo.Name
} else {
    Register-PSRepository -Name $tempRepoName -SourceLocation $tempRepoPath -PublishLocation $tempRepoPath -InstallationPolicy Trusted -PackageManagementProvider NuGet
}

$env:PSModulePath = "$env:PSModulePath;$tempRepoPath"

$Errors = $null

try {
    $modules = Get-AllModules -BuildConfig $BuildConfig -Scope $Scope -PublishLocal:$PublishLocal -Profile $Profile -IsNetCore:$IsNetCore
    Add-AllModules -ModulePaths $modules -TempRepo $tempRepoName -TempRepoPath $tempRepoPath -NugetExe $NugetExe
    Publish-AllModules -ModulePaths $modules -ApiKey $apiKey -TempRepoPath $tempRepoPath -RepoLocation $repositoryLocation -NugetExe $NugetExe -PublishLocal:$PublishLocal
} catch {
    Write-Error ($_ | Out-String)
} finally {
    Unregister-PSRepository -Name $tempRepoName
}

if ($Errors -ne $null) {
    exit 1
}
exit 0
