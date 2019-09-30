<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

#
# Module manifest for module 'Azs.Deployment.Admin'
#
# Generated by: bganapa
#
# Generated on: 9/30/2019
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Azs.Deployment.Admin.psm1'

# Version number of this module.
ModuleVersion = '0.1.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'f655dbbc-137d-41cc-9217-10ec5c479040'

# Author of this module
Author = 'bganapa'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2019 bganapa. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Deployment Admin Client'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 
               '.\Generated.PowerShell.Commands\FormatFiles\ActionPlanAdminProperties.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ActionPlanList.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ActionPlanOperationAdminProperties.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ActionPlanOperationResourceEntity.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ActionPlanOperationsList.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ActionPlanResourceEntity.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ActionType.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\DeployActionParameters.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\Display.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ErrorInfo.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ExtendedErrorInfo.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\FileContainer.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\FileContainerParameters.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\FileContainersList.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\GenericIdentifier.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\GenericVersion.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\Operation.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\OperationList.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ProductLink.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ProductPackage.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ProductPackagesList.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ProductProperties.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ProductSecret.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ProductSecretsList.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\ProvisioningState.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\Resource.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\SecretParameters.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\SecretState.ps1xml', 
               '.\Generated.PowerShell.Commands\FormatFiles\UnlockActionParameters.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('PSSwaggerUtility')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'New-ProductPackage', 'Get-Operation', 'Get-ActionPlan', 
               'Remove-ProductDeployment', 'Get-ActionPlanOperation', 
               'Lock-ProductDeployment', 'Unlock-ProductDeployment', 
               'Get-ProductPackage', 'New-FileContainer', 'Deploy-ProductDeployment', 
               'Remove-FileContainer', 'Boot-ProductDeploymentStrap', 
               'Get-ProductSecret', 'Import-ProductSecret', 'Test-ProductSecret', 
               'Rotate-ProductDeploymentSecret', 'Get-FileContainer', 
               'New-FileContainerParametersObject', 'New-GenericVersionObject', 
               'New-SecretParametersObject', 'New-UnlockActionParametersObject', 
               'New-BootStrapActionParametersObject'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


