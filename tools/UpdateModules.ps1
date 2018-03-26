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
.SYNOPSIS Update the modules.

.PARAMETER BuildConfig
    The build configuration, either Debug or Release

.PARAMETER Scope
    The class of modules or the specific modules to update.

.PARAMETER Profile
    Either Latest or Stack.

#>
param(
    [Parameter(Mandatory = $false, Position = 0)]
    [ValidateSet("Release", "Debug")]
    [string] $BuildConfig,

    [Parameter(Mandatory = $false, Position = 1)]
    [string] $Scope,

    [Parameter(Mandatory = $false)]
    [ValidateSet("Latest", "Stack")]
    [string] $Profile = "Latest"
)

<#

.SYNOPSIS Creates a new psm1 root module if one does not exist.

.PARAMETER ModulePath
    Path to the module.

.PARAMETER TemplatePath
    Path to the template

.PARAMETER IsRMModule
    Specifies if resource management module.

#>
function New-ModulePsm1 {
    [CmdletBinding()]
    param(
        [string]$ModulePath,
        [string]$TemplatePath,
        [switch]$IsRMModule
    )

    PROCESS {
        $manifestDir = Get-Item -Path $ModulePath
        $moduleName = $manifestDir.Name + ".psd1"
        $manifestPath = Join-Path -Path $ModulePath -ChildPath $moduleName
        $file = Get-Item $manifestPath
        Import-LocalizedData -BindingVariable ModuleMetadata -BaseDirectory $file.DirectoryName -FileName $file.Name

        # Do not create a psm1 file if the RootModule dependency already has one.
        if ($ModuleMetadata.RootModule) {
            Write-Host "skipping update..."
            return
        }

        # Create the actual file and insert import statements.
        $templateOutputPath = $manifestPath -replace ".psd1", ".psm1"
        [string]$importedModules
        if ($ModuleMetadata.RequiredModules -ne $null) {
            foreach ($mod in $ModuleMetadata.RequiredModules) {
                if ($mod["ModuleVersion"]) {
                    $importedModules += Get-MinimumVersionEntry -ModuleName $mod["ModuleName"] -MinimumVersion $mod["ModuleVersion"]
                } elseif ($mod["RequiredVersion"]) {
                    $importedModules += "Import-Module " + $mod["ModuleName"] + " -RequiredVersion " + $mod["RequiredVersion"] + "`r`n"
                }
            }
        }

        # Create imports for nested modules.
        if ($ModuleMetadata.NestedModules -ne $null) {
            foreach ($dll in $ModuleMetadata.NestedModules) {
                $importedModules += "Import-Module (Join-Path -Path `$PSScriptRoot -ChildPath " + $dll.Substring(2) + ")`r`n"
            }
        }

        # Grab the template and replace with information.
        $template = Get-Content -Path $TemplatePath
        $template = $template -replace "%MODULE-NAME%", $file.BaseName
        $template = $template -replace "%DATE%", [string](Get-Date)
        $template = $template -replace "%IMPORTED-DEPENDENCIES%", $importedModules

        # Add deprecation messages
        if ($ModulePath -like "*Profile*") {
            $WarningMessage = "`"PowerShell version 3 and 4 will no longer be supported starting in May 2018. Please update to the latest version of PowerShell 5.1`""
            $template = $template -replace "%PSVersionDeprecationMessage%",
            "`$SpecialFolderPath = Join-Path -Path ([Environment]::GetFolderPath('ApplicationData')) -ChildPath 'Windows Azure Powershell' `
            `$DeprecationFile = Join-Path -Path `$SpecialFolderPath -ChildPath 'PSDeprecationWarning.txt' `
            if (!(Test-Path `$DeprecationFile)) { `
                Write-Warning $WarningMessage `
                try { `
                $WarningMessage | Out-File -FilePath `$DeprecationFile `
                } catch {} `
            }"
        } else {
            $template = $template -replace "%PSVersionDeprecationMessage%", ""
        }

        # Handle nested modules
        $completerCommands = Find-CompleterAttribute -ModuleMetadata $ModuleMetadata -ModulePath $ModulePath -IsRMModule:$IsRMModule
        $template = $template -replace "%COMPLETERCOMMANDS%", $completerCommands

        # Handle
        $contructedCommands = Find-DefaultResourceGroupCmdlets -IsRMModule:$IsRMModule -ModuleMetadata $ModuleMetadata -ModulePath $ModulePath
        $template = $template -replace "%DEFAULTRGCOMMANDS%", $contructedCommands

        Write-Host "Writing psm1 manifest to $templateOutputPath"
        $template | Out-File -FilePath $templateOutputPath -Force
        $file = Get-Item -Path $templateOutputPath

        Add-PSM1Dependency -Path $manifestPath -ModuleName $moduleName
    }
}

<#

.SYNOPSIS Add psm1 root module to psd1 file for module.

.PARAMETER Path
    Path to the psd1 file.

.PARAMETER ModuleName
    Name of the psd1 file

#>
function Add-PSM1Dependency {
    [CmdletBinding()]
    param(
        [string] $Path,
        [string] $ModuleName
    )

    PROCESS {
        $psm1file = $ModuleName -replace ".psd1", ".psm1"
        Update-ModuleManifest -Path $Path -RootModule $psm1file
    }
}

<#
.SYNOPSIS Gets a list of nested module cmdlets

.PARAMETER ModuleMetadata
    Module metadata for the current module.

.PARAMETER ModulePath
    Path to the current module.

#>
function Get-Cmdlets {
    [CmdletBinding()]
    param(
        [Hashtable]$ModuleMetadata,
        [string]$ModulePath
    )
    $nestedModules = $ModuleMetadata.NestedModules
    $cmdlets = @()
    foreach ($module in $nestedModules) {
        $dllPath = Join-Path -Path $ModulePath -ChildPath $module
        $Assembly = [Reflection.Assembly]::LoadFrom($dllPath)
        $dllCmdlets = $Assembly.GetTypes() | Where-Object {$_.CustomAttributes.AttributeType.Name -contains "CmdletAttribute"}
        $cmdlets += $dllCmdlets        
    }
    return $cmdlets
}

<#
.SYNOPSIS Construct completer attributes for nested modules in resource management modules.

.PARAMETER ModuleMetadata
    Module metadata for the current module.

.PARAMETER ModulePath
    Path to the current module.

.PARAMETER IsRMModule
    Specifies if resource management module.

#>
function Find-CompleterAttribute {
    [CmdletBinding()]
    param(
        [Hashtable]$ModuleMetadata,
        [string]$ModulePath,
        [switch]$IsRMModule
    )
    PROCESS {
        # Only add for resource management modules.
        $constructedCommands = "@("
        if ($IsRMModule) {
            $AllCmdlets = Get-Cmdlets -ModuleMetadata $ModuleMetadata -ModulePath $ModulePath
            foreach ($currentCmdlet in $AllCmdlets) {
                $parameters = $currentCmdlet.GetProperties()
                foreach ($parameter in $parameters) {
                    $completerAttribute = $parameter.CustomAttributes | Where-Object {$_.AttributeType.BaseType.Name -eq "PSCompleterBaseAttribute"}
                    if ($completerAttribute -ne $null) {
                        $attributeTypeName = "System.Management.Automation.CmdletAttribute"
                        $constructedCommands += "@{'Command' = '" + $currentCmdlet.GetCustomAttributes($attributeTypeName).VerbName + "-" + $currentCmdlet.GetCustomAttributes($attributeTypeName).NounName + "'; "
                        $constructedCommands += "'Parameter' = '" + $parameter.Name + "'; "
                        $constructedCommands += "'AttributeType' = '" + $completerAttribute.AttributeType + "'; "

                        # Handle constructor
                        if ($completerAttribute.ConstructorArguments.Count -eq 0) {
                            $constructedCommands += "'ArgumentList' = @()"
                        } else {
                            $constructedCommands += "'ArgumentList' = @("
                            $completerAttribute.ConstructorArguments.Value | ForEach-Object {
                                $constructedCommands += "'" + $parameter.Value + "',"
                            }
                            $constructedCommands = $constructedCommands -replace ".$", ")"
                        }
                        $constructedCommands += "},"
                    }
                }
            }
            $constructedCommands = $constructedCommands -replace ",$", ")"
        }
        $constructedCommands += ")"
        return $constructedCommands
    }
}

<#
.SYNOPSIS Handle nested modules for resource management modules which required ResourceGroupName

.PARAMETER ModuleMetadata
    Module metadata.

.PARAMETER ModulePath
    Path to the module.

.PARAMETER IsRMModule
    Specifies if resource management module.

#>
function Find-DefaultResourceGroupCmdlets {
    [CmdletBinding()]
    param(
        [Hashtable]$ModuleMetadata,
        [string]$ModulePath,
        [switch]$IsRMModule
    )
    PROCESS {
        $contructedCommands = "@("
        if ($IsRMModule) {
            $AllCmdlets = Get-Cmdlets -ModuleMetadata $ModuleMetadata -ModulePath $ModulePath
            $FilteredCommands = $AllCmdlets | Where-Object {Test-CmdletRequiredParameter -Cmdlet $_ -Parameter "ResourceGroupName"}
            foreach ($command in $FilteredCommands) {
                $contructedCommands += "'" + $command.GetCustomAttributes("System.Management.Automation.CmdletAttribute").VerbName + "-" + $command.GetCustomAttributes("System.Management.Automation.CmdletAttribute").NounName + ":ResourceGroupName" + "',"
            }
            $contructedCommands = $contructedCommands -replace ",$", ""
        }
        $contructedCommands += ")"
        return $contructedCommands
    }
}

<#
.SYNOPSIS Test to see if parameter is required.

.PARAMETER Cmdlet
    Cmdlet object.

.PARAMETER Parameter
    Name of the parameter

#>
function Test-CmdletRequiredParameter {
    [CmdletBinding()]
    param(
        [Object]$Cmdlet,
        [string]$Parameter
    )

    PROCESS {
        $rgParameter = $Cmdlet.GetProperties() | Where-Object {$_.Name -eq $Parameter}
        if ($rgParameter -ne $null) {
            $parameterAttributes = $rgParameter.CustomAttributes | Where-Object {$_.AttributeType.Name -eq "ParameterAttribute"}
            foreach ($attr in $parameterAttributes) {
                $hasParameterSet = $attr.NamedArguments | Where-Object {$_.MemberName -eq "ParameterSetName"}
                $MandatoryParam = $attr.NamedArguments | Where-Object {$_.MemberName -eq "Mandatory"}
                if (($hasParameterSet -ne $null) -or (!$MandatoryParam.TypedValue.Value)) {
                    return $true
                }
            }
        }
        return $false
    }
}

<#
.SYNOPSIS Get the code entry to test for the required minimum version to be loaded for the specified module.

.PARAMETER ModuleName
    Name of the module.

.PARAMETER MinimumVersion
    The minimum version required for the module.

#>
function Get-MinimumVersionEntry {
    [CmdletBinding()]
    param(
        [string]$ModuleName,
        [string]$MinimumVersion
    )

    PROCESS {
        return "`$module = Get-Module $ModuleName `
if (`$module -ne `$null -and `$module.Version.ToString().CompareTo(`"$MinimumVersion`") -lt 0) `
{ `
    Write-Error `"This module requires $ModuleName version $MinimumVersion. An earlier version of $ModuleName is imported in the current PowerShell session. Please open a new session before importing this module. This error could indicate that multiple incompatible versions of the Azure PowerShell cmdlets are installed on your system. Please see https://aka.ms/azps-version-error for troubleshooting information.`" -ErrorAction Stop `
} `
elseif (`$module -eq `$null) `
{ `
    Import-Module $ModuleName -MinimumVersion $MinimumVersion -Scope Global `
}`r`n"
    }
}

<#
.SYNOPSIS Update the Azure modules.

.PARAMETER Scope
The class of modules or a specific module.

.PARAMETER BuildConfig
Either Debug or Release

#>
function Update-Azure {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String]$Scope,

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Debug', 'Release')]
        [String]$BuildConfig
    )    
    $resourceManagerModules = Get-ChildItem -Path $resourceManagerRootFolder -Directory

    # Publish AzureStorage, if needed.
    if (($scope -eq 'All') -or ($scope -eq 'AzureStorage')) {
        $modulePath = "$packageFolder\$buildConfig\Storage\Azure.Storage"
        # Publish AzureStorage module
        Write-Host "Updating AzureStorage module from $modulePath"
        New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation
    }

    # Publish ServiceManagement, if needed.
    if (($scope -eq 'All') -or ($scope -eq 'ServiceManagement')) {
        $modulePath = "$packageFolder\$buildConfig\ServiceManagement\Azure"
        # Publish Azure module
        Write-Host "Updating ServiceManagement(aka Azure) module from $modulePath"
        New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation 
    }

    # Publish all of the modules, if specified.
    if ($scope -eq 'All') {
        foreach ($module in $resourceManagerModules) {
            # filter out AzureRM.Profile which always gets published first
            # And "Azure.Storage" which is built out as test dependencies
            if (($module.Name -ne "AzureRM.Profile") -and ($module.Name -ne "Azure.Storage")) {
                $modulePath = $module.FullName
                Write-Host "Updating $module module from $modulePath"
                New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation -IsRMModule
                Write-Host "Updated $module module"
            }
        }
    }

    # Publish a specific module if one of the rollups are not specified.
    if (($scope -ne 'All') -and ($scope -ne 'AzureRM') ) {
        $modulePath = Join-Path $resourceManagerRootFolder "AzureRM.$scope"
        if (Test-Path $modulePath) {
            Write-Host "Updating $scope module from $modulePath"
            New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation 
            Write-Host "Updated $scope module"
        } else {
            Write-Error "Can not find module with name $scope to publish"
        }
    }

    if (($scope -eq 'All') -or ($scope -eq 'AzureRM')) {
        # Update AzureRM module
        $modulePath = "$PSScriptRoot\AzureRM"
        Write-Host "Updating AzureRM module from $modulePath"
        New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation 
        Write-Host "Updated Azure module"
    }    
}

<#
.SYNOPSIS Update the AzureRM and AzureStack modules.
#>
function Update-Stack {
    [CmdletBinding()]
    param()

    # Overwrite defaults
    $packageFolder = "$PSScriptRoot\..\src\Stack"
    $resourceManagerRootFolder = "$packageFolder\$buildConfig\ResourceManager\AzureResourceManager"
    $resourceManagerModules = Get-ChildItem -Path $resourceManagerRootFolder -Directory

    # AzureRM Rollup module
    $modulePath = "$PSScriptRoot\..\src\StackAdmin\AzureRM"
    Write-Host "Updating AzureRM module from $modulePath"
    New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation 
    Write-Host "Updated AzureRM module"

    # Azure Stack Admin Rollup module
    $modulePath = "$PSScriptRoot\..\src\StackAdmin\AzureStack"
    Write-Host "Updating AzureStack module from $modulePath"
    New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation 
    Write-Host "Updated AzureStack module"

}

<#
    Update .NET core modules.
#>
function Update-Netcore {
    [CmdletBinding()]
    param()

    # Publish the Netcore modules and rollup module, if specified.
    if ($scope -eq 'AzureRM.Netcore') {
        Write-Host "Updating profile module"
        New-ModulePsm1 -ModulePath "$resourceManagerRootFolder\AzureRM.Profile.Netcore" -TemplatePath $templateLocation -IsRMModule
        Write-Host "Updated profile module"

        $env:PSModulePath += "$([IO.Path]::PathSeparator)$resourceManagerRootFolder\AzureRM.Profile.Netcore";

        foreach ($module in $resourceManagerModules) {
            if (($module.Name -ne "AzureRM.Profile.Netcore")) {
                $modulePath = $module.FullName
                Write-Host "Updating $module module from $modulePath"
                New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation -IsRMModule
                Write-Host "Updated $module module"
            }
        }

        $modulePath = "$PSScriptRoot\AzureRM.Netcore"
        Write-Host "Updating AzureRM.Netcore module from $modulePath"
        New-ModulePsm1 -ModulePath $modulePath -TemplatePath $templateLocation 
        Write-Host "Updated AzureRM.Netcore module"
    }

}

$packageFolder = "$PSScriptRoot\..\src\Package"
$resourceManagerRootFolder = "$packageFolder\$buildConfig\ResourceManager\AzureResourceManager"

if ([string]::IsNullOrEmpty($buildConfig)) {
    Write-Verbose "Setting build configuration to 'Release'"
    $buildConfig = "Release"
}

if ([string]::IsNullOrEmpty($scope)) {
    Write-Verbose "Default scope to all"
    $scope = 'All'
}

Write-Host "Updating $scope package(and its dependencies)"

$templateLocation = "$PSScriptRoot\AzureRM.Example.psm1"

# If we publish 'All', publish AzureRM.Profile first, because it is the common dependency.
if (($scope -eq 'All') -or ($scope -eq 'Stack')) {
    Write-Host "Updating profile module"
    New-ModulePsm1 -ModulePath "$resourceManagerRootFolder\AzureRM.Profile" -TemplatePath $templateLocation -IsRMModule
    Write-Host "Updated profile module"
}

if ($Profile -eq 'Stack') {
    Update-Stack
} elseif ($Scope -eq 'AzureRM.NetCore') {
    Update-Netcore
} else {
    Update-Azure -Scope $Scope -BuildConfig $BuildConfig
}

