<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Delete the specified offer.

.DESCRIPTION
    Delete the specified offer.

.PARAMETER Name
    Name of an offer.

.PARAMETER ResourceId
    The resource id.

.PARAMETER ResourceGroup
    The resource group the resource is located under.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Offer.

.PARAMETER Force
    Flag to remove the item without confirmation.

.EXAMPLE
    Remove-AzsOffer -Name offername1 -ResourceGroupName rg1
#>
function Remove-AzsOffer
{
    [CmdletBinding(DefaultParameterSetName='Offers_Delete')]
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Offers_Delete')]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true, ParameterSetName = 'ResourceId_Offers_Delete')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Offers_Delete')]
        [Parameter(Mandatory = $true, ParameterSetName = 'InputObject_Offers_Delete')]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_Offers_Delete')]
        [System.String]
        $ResourceId,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_Offers_Delete')]
        [Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Offer]
        $InputObject,

        [Parameter(Mandatory = $false)]
        [switch]
        $Force
    )

    Begin
    {
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
        FullClientTypeName = 'Microsoft.AzureStack.Management.Subscriptions.Admin.SubscriptionsAdminClient'
    }

    $GlobalParameterHashtable = @{}
    $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

    $GlobalParameterHashtable['SubscriptionId'] = $null
    if($PSBoundParameters.ContainsKey('SubscriptionId')) {
        $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
    }

    $SubscriptionsAdminClient = New-ServiceClient @NewServiceClient_params

    $Offer = $Name

    if('InputObject_Offers_Delete' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Offers_Delete' -eq $PsCmdlet.ParameterSetName) {
        $GetArmResourceIdParameterValue_params = @{
            IdTemplate = '/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/Microsoft.Subscriptions.Admin/offers/{offer}'
        }

        if('ResourceId_Offers_Delete' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
        }
        else {
            $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
        }
        $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
        $resourceGroupName = $ArmResourceIdParameterValues['resourceGroupName']

        $offer = $ArmResourceIdParameterValues['offer']
    }
    
    if ($PSCmdlet.ShouldProcess("$Offer" , "Delete offer")) {
        if (($Force.IsPresent -or $PSCmdlet.ShouldContinue("Delete offer?", "Performing operation DeleteWithHttpMessagesAsync on $Offer."))) {

            if ('Offers_Delete' -eq $PsCmdlet.ParameterSetName -or 'InputObject_Offers_Delete' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Offers_Delete' -eq $PsCmdlet.ParameterSetName) {
                Write-Verbose -Message 'Performing operation DeleteWithHttpMessagesAsync on $SubscriptionsAdminClient.'
                $TaskResult = $SubscriptionsAdminClient.Offers.DeleteWithHttpMessagesAsync($ResourceGroupName, $Offer)
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

