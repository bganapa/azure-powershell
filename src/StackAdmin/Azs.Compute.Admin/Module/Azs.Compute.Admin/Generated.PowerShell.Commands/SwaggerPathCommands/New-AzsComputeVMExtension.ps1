<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.

Code generated by Microsoft (R) PSSwagger
Changes may cause incorrect behavior and will be lost if the code is regenerated.
#>

<#
.SYNOPSIS
    Create a Virtual Machine Extension Image.

.DESCRIPTION
    Create a Virtual Machine Extension Image.

.PARAMETER Type
    Type of extension.

.PARAMETER Version
    The version of the vritual machine image extension.

.PARAMETER LocationName
    Location of the resource.

.PARAMETER ResourceId
    The resource id.

.PARAMETER Publisher
    Name of the publisher.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Compute.Admin.Models.VMExtension.

.PARAMETER Extension
    Virtual Machine Extension Image creation properties.

#>
function New-AzsComputeVMExtension {
    [OutputType([Microsoft.AzureStack.Management.Compute.Admin.Models.VMExtension])]
    [CmdletBinding(DefaultParameterSetName = 'VMExtensions_Create')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'VMExtensions_Create')]
        [System.String]
        $Type,

        [Parameter(Mandatory = $true, ParameterSetName = 'VMExtensions_Create')]
        [System.String]
        $Version,

        [Parameter(Mandatory = $false, ParameterSetName = 'VMExtensions_Create')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_VMExtensions_Create')]
        [System.String]
        $ResourceId,

        [Parameter(Mandatory = $true, ParameterSetName = 'VMExtensions_Create')]
        [System.String]
        $Publisher,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_VMExtensions_Create')]
        [Microsoft.AzureStack.Management.Compute.Admin.Models.VMExtension]
        $InputObject,

        [Parameter(Mandatory = $true, ParameterSetName = 'VMExtensions_Create')]
        [Parameter(Mandatory = $true, ParameterSetName = 'ResourceId_VMExtensions_Create')]
        [Parameter(Mandatory = $true, ParameterSetName = 'InputObject_VMExtensions_Create')]
        [Microsoft.AzureStack.Management.Compute.Admin.Models.VMExtensionParameters]
        $Extension
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

        if ('InputObject_VMExtensions_Create' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_VMExtensions_Create' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Compute.Admin/locations/{locationName}/artifactTypes/VMExtension/publishers/{publisher}/types/{type}/versions/{version}'
            }

            if ('ResourceId_VMExtensions_Create' -eq $PsCmdlet.ParameterSetName) {
                $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
            } else {
                $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
            }
            $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params

            $Location = $ArmResourceIdParameterValues['locationName']
            $publisher = $ArmResourceIdParameterValues['publisher']
            $type = $ArmResourceIdParameterValues['type']
            $version = $ArmResourceIdParameterValues['version']
        } elseif ( -not $PSBoundParameters.ContainsKey('Location')) {
            $Location = (Get-AzureRMLocation).Location
        }


        if ('VMExtensions_Create' -eq $PsCmdlet.ParameterSetName -or 'InputObject_VMExtensions_Create' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_VMExtensions_Create' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation CreateWithHttpMessagesAsync on $ComputeAdminClient.'
            $TaskResult = $ComputeAdminClient.VMExtensions.CreateWithHttpMessagesAsync($Location, $Publisher, $Type, $Version, $Extension)
        } else {
            Write-Verbose -Message 'Failed to map parameter set to operation method.'
            throw 'Module failed to find operation to execute.'
        }

        if ($TaskResult) {
            $GetTaskResult_params = @{
                TaskResult = $TaskResult
            }

            Get-TaskResult @GetTaskResult_params

        }
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

