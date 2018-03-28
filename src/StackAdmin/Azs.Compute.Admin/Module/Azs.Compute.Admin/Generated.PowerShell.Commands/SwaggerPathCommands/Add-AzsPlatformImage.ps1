<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.

Code generated by Microsoft (R) PSSwagger
Changes may cause incorrect behavior and will be lost if the code is regenerated.
#>

<#
.SYNOPSIS
    Creates a new virtual machine platform image from a given image configuration.

.DESCRIPTION
    Creates a new platform image.

.PARAMETER Publisher
    Name of the publisher.

.PARAMETER Offer
    Name of the offer.

.PARAMETER Sku
    Name of the SKU.

.PARAMETER Version
    The version of the virtual machine platform image.

.PARAMETER OsType
    Operating system type.

.PARAMETER OsUri
    Location of the disk.

.PARAMETER BillingPartNumber
    The part number is used to bill for software costs.

.PARAMETER DataDisks
    Data disks used by the platform image.

.PARAMETER Location
    Location of the resource.

.EXAMPLE

    PS C:\> Add-AzsPlatformImage -Publisher Test -Offer UbuntuServer -Sku 16.04-LTS -Version 1.0.0 -OsType "Linux" -OsUri "https://test.blob.local.azurestack.external/test/xenial-server-cloudimg-amd64-disk1.vhd"

    Add a new platform image.

#>
function Add-AzsPlatformImage {
    [OutputType([Microsoft.AzureStack.Management.Compute.Admin.Models.PlatformImage])]
    [CmdletBinding(DefaultParameterSetName = 'Create')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [System.String]
        $Publisher,

        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [System.String]
        $Offer,

        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [System.String]
        $Sku,

        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [System.String]
        $Version,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Unknown', 'Windows', 'Linux')]
        $OsType,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OsUri,

        [Parameter(Mandatory = $false)]
        [System.String]
        $BillingPartNumber,

        [Parameter(Mandatory = $false)]
        [Microsoft.AzureStack.Management.Compute.Admin.Models.DataDisk[]]
        $DataDisks,

        [Parameter(Mandatory = $false, ParameterSetName = 'Create')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $false)]
        [switch]
        $Wait
    )

    Begin {
        Initialize-PSSwaggerDependencies -Azure
        $tracerObject = $null
        if (('continue' -eq $DebugPreference) -or ('inquire' -eq $DebugPreference)) {
            $oldDebugPreference = $global:DebugPreference
            $global:DebugPreference = "continue"
            $tracerObject = New-PSSwaggerClientTracing
            Register-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }

    Process {

        $ErrorActionPreference = 'Stop'

        $NewServiceClient_params = @{
            FullClientTypeName = 'Microsoft.AzureStack.Management.Compute.Admin.ComputeAdminClient'
        }

        $GlobalParameterHashtable = @{}
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $ComputeAdminClient = New-ServiceClient @NewServiceClient_params

        # Create object
        $flattenedParameters = @('DataDisks')
        $utilityCmdParams = @{}
        $utilityCmdParams['OsDisk'] = New-OSDiskObject -OsType $OsType -Uri $OsUri
        if ($PSBoundParameters.ContainsKey('BillingPartNumber')) {
            $utilityCmdParams['Details'] = New-ImageDetailsObject -BillingPartNumber $PSBoundParameters['BillingPartNumber']
        }
        $flattenedParameters | ForEach-Object {
            if ($PSBoundParameters.ContainsKey($_)) {
                $utilityCmdParams[$_] = $PSBoundParameters[$_]
            }
        }

        $NewImage = New-PlatformImageParametersObject @utilityCmdParams

        if ( -not $PSBoundParameters.ContainsKey('Location')) {
            $Location = (Get-AzureRMLocation).Location
        }

        if ('Create' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation CreateWithHttpMessagesAsync on $ComputeAdminClient.'
            $TaskResult = $ComputeAdminClient.PlatformImages.CreateWithHttpMessagesAsync($Location, $Publisher, $Offer, $Sku, $Version, $NewImage)
        } else {
            Write-Verbose -Message 'Failed to map parameter set to operation method.'
            throw 'Module failed to find operation to execute.'
        }

        Write-Verbose -Message "Waiting for the operation to complete."

        $PSSwaggerJobScriptBlock = {
            [CmdletBinding()]
            param(
                [Parameter(Mandatory = $true)]
                [System.Threading.Tasks.Task]
                $TaskResult,

                [Parameter(Mandatory = $true)]
                [string]
                $TaskHelperFilePath
            )
            if ($TaskResult) {
                . $TaskHelperFilePath
                $GetTaskResult_params = @{
                    TaskResult = $TaskResult
                }

                Get-TaskResult @GetTaskResult_params

            }
        }

        $PSCommonParameters = Get-PSCommonParameter -CallerPSBoundParameters $PSBoundParameters
        $TaskHelperFilePath = Join-Path -Path $ExecutionContext.SessionState.Module.ModuleBase -ChildPath 'Get-TaskResult.ps1'
        if ($Wait) {
            Invoke-Command -ScriptBlock $PSSwaggerJobScriptBlock `
                -ArgumentList $TaskResult, $TaskHelperFilePath `
                @PSCommonParameters
        } else {
            $ScriptBlockParameters = New-Object -TypeName 'System.Collections.Generic.Dictionary[string,object]'
            $ScriptBlockParameters['TaskResult'] = $TaskResult
            $ScriptBlockParameters['AsJob'] = $true
            $ScriptBlockParameters['TaskHelperFilePath'] = $TaskHelperFilePath
            $PSCommonParameters.GetEnumerator() | ForEach-Object { $ScriptBlockParameters[$_.Name] = $_.Value }

            Start-PSSwaggerJobHelper -ScriptBlock $PSSwaggerJobScriptBlock `
                -CallerPSBoundParameters $ScriptBlockParameters `
                -CallerPSCmdlet $PSCmdlet `
                @PSCommonParameters
        }
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

