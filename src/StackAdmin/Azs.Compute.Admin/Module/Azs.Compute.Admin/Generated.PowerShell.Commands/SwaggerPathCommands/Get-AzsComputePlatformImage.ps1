<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.

Code generated by Microsoft (R) PSSwagger
Changes may cause incorrect behavior and will be lost if the code is regenerated.
#>

<#
.SYNOPSIS
    Returns virtual machine images loaded into the platform image repository.

.DESCRIPTION
    Returns a list of all platform images.

.PARAMETER Sku
    Name of the SKU.

.PARAMETER Version
    The version of the platform image.

.PARAMETER Location
    Location of the resource.

.PARAMETER ResourceId
    The resource id.

.PARAMETER Publisher
    Name of the publisher.

.PARAMETER Offer
    Name of the offer.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Compute.Admin.Models.PlatformImage.

.EXAMPLE
C:\PS> Get-AzsComputePlatformImage -Location local
Id                             Type                           Name                           Location
--                             ----                           ----                           --------
/subscriptions/0dbab76e-037... Microsoft.Compute.Admin/loc...                                local
/subscriptions/0dbab76e-037... Microsoft.Compute.Admin/loc...                                local
/subscriptions/0dbab76e-037... Microsoft.Compute.Admin/loc...                                local

Returns virtual machine images loaded into the platform image repository at the location local.

.EXAMPLE
C:\PS> Get-AzsComputePlatformImage -Location "local" -Publisher Canonical -Offer UbuntuServer -Sku 16.04-LTS -Version 0.1.0

Id                             Type                           Name                           Location
--                             ----                           ----                           --------
/subscriptions/0dbab76e-037... Microsoft.Compute.Admin/loc...                                local

Get a specific platform image.

#>
function Get-AzsComputePlatformImage {
    [OutputType([Microsoft.AzureStack.Management.Compute.Admin.Models.PlatformImage])]
    [CmdletBinding(DefaultParameterSetName = 'PlatformImages_List')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'PlatformImages_Get')]
        [System.String]
        $Sku,

        [Parameter(Mandatory = $true, ParameterSetName = 'PlatformImages_Get')]
        [System.String]
        $Version,

        [Parameter(Mandatory = $false, ParameterSetName = 'PlatformImages_List')]
        [Parameter(Mandatory = $false, ParameterSetName = 'PlatformImages_Get')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_PlatformImages_Get')]
        [System.String]
        $ResourceId,

        [Parameter(Mandatory = $true, ParameterSetName = 'PlatformImages_Get')]
        [System.String]
        $Publisher,

        [Parameter(Mandatory = $true, ParameterSetName = 'PlatformImages_Get')]
        [System.String]
        $Offer,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_PlatformImages_Get')]
        [Microsoft.AzureStack.Management.Compute.Admin.Models.PlatformImage]
        $InputObject
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


        if ('InputObject_PlatformImages_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_PlatformImages_Get' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Compute.Admin/locations/{locationName}/artifactTypes/platformImage/publishers/{publisher}/offers/{offer}/skus/{sku}/versions/{version}'
            }

            if ('ResourceId_PlatformImages_Get' -eq $PsCmdlet.ParameterSetName) {
                $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
            } else {
                $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
            }
            $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params

            $location = $ArmResourceIdParameterValues['locationName']
            $publisher = $ArmResourceIdParameterValues['publisher']
            $offer = $ArmResourceIdParameterValues['offer']
            $sku = $ArmResourceIdParameterValues['sku']
            $version = $ArmResourceIdParameterValues['version']
        } elseif ( -not $PSBoundParameters.ContainsKey('Location')) {
            $Location = (Get-AzureRMLocation).Location
        }

        $filterInfos = @(
            @{
                'Type'     = 'powershellWildcard'
                'Value'    = $Version
                'Property' = 'Name'
            })
        $applicableFilters = Get-ApplicableFilters -Filters $filterInfos
        if ($applicableFilters | Where-Object { $_.Strict }) {
            Write-Verbose -Message 'Performing server-side call ''Get-AzsComputePlatformImage -'''
            $serverSideCall_params = @{

            }

            $serverSideResults = Get-AzsComputePlatformImage @serverSideCall_params
            foreach ($serverSideResult in $serverSideResults) {
                $valid = $true
                foreach ($applicableFilter in $applicableFilters) {
                    if (-not (Test-FilteredResult -Result $serverSideResult -Filter $applicableFilter.Filter)) {
                        $valid = $false
                        break
                    }
                }

                if ($valid) {
                    $serverSideResult
                }
            }
            return
        }
        if ('PlatformImages_List' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation ListWithHttpMessagesAsync on $ComputeAdminClient.'
            $TaskResult = $ComputeAdminClient.PlatformImages.ListWithHttpMessagesAsync($Location)
        } elseif ('PlatformImages_Get' -eq $PsCmdlet.ParameterSetName -or 'InputObject_PlatformImages_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_PlatformImages_Get' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation GetWithHttpMessagesAsync on $ComputeAdminClient.'
            $TaskResult = $ComputeAdminClient.PlatformImages.GetWithHttpMessagesAsync($Location, $Publisher, $Offer, $Sku, $Version)
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

