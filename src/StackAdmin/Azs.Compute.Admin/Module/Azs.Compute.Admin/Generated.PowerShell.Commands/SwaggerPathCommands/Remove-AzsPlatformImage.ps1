<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.

Code generated by Microsoft (R) PSSwagger
Changes may cause incorrect behavior and will be lost if the code is regenerated.
#>

<#
.SYNOPSIS
    Delete a virtual machine image from the platform image repository.

.DESCRIPTION
    Delete a platform image

.PARAMETER Publisher
    Name of the publisher.

.PARAMETER Sku
    Name of the SKU.

.PARAMETER Offer
    Name of the offer.

.PARAMETER Version
    The version of the virtual machine image.

.PARAMETER Location
    Location of the resource.

.PARAMETER ResourceId
    The resource id.

.EXAMPLE
PS C:\> Remove-AzsPlatformImage -Location local -Publisher Test -Offer UbuntuServer -Version 1.0.0 -Sku 16.04-LTS

Delete an existing platform image.

#>
function Remove-AzsPlatformImage {
    [CmdletBinding(DefaultParameterSetName = 'Delete', SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Delete')]
        [System.String]
        $Publisher,

        [Parameter(Mandatory = $true, ParameterSetName = 'Delete')]
        [System.String]
        $Offer,

        [Parameter(Mandatory = $true, ParameterSetName = 'Delete')]
        [System.String]
        $Sku,

        [Parameter(Mandatory = $true, ParameterSetName = 'Delete')]
        [System.String]
        $Version,

        [Parameter(Mandatory = $false, ParameterSetName = 'Delete')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId')]
        [Alias('id')]
        [System.String]
        $ResourceId,

        [Parameter(Mandatory = $false)]
        [switch]
        $Force
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

        if ('ResourceId' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Compute.Admin/locations/{locationName}/artifactTypes/platformImage/publishers/{publisher}/offers/{offer}/skus/{sku}/versions/{version}'
            }

            $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
            $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params

            $Location = $ArmResourceIdParameterValues['locationName']
            $publisher = $ArmResourceIdParameterValues['publisher']
            $offer = $ArmResourceIdParameterValues['offer']
            $sku = $ArmResourceIdParameterValues['sku']
            $version = $ArmResourceIdParameterValues['version']
        } elseif ( -not $PSBoundParameters.ContainsKey('Location')) {
            $Location = (Get-AzureRMLocation).Location
        }

        if ($PSCmdlet.ShouldProcess("$sku" , "Delete platform image")) {
            if (($Force.IsPresent -or $PSCmdlet.ShouldContinue("Delete platform image?", "Performing operation DeleteWithHttpMessagesAsync on $sku."))) {

                if ('Delete' -eq $PsCmdlet.ParameterSetName -or 'ResourceId' -eq $PsCmdlet.ParameterSetName) {
                    Write-Verbose -Message 'Performing operation DeleteWithHttpMessagesAsync on $ComputeAdminClient.'
                    $TaskResult = $ComputeAdminClient.PlatformImages.DeleteWithHttpMessagesAsync($Location, $Publisher, $Offer, $Sku, $Version)
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
        }
    }
    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

