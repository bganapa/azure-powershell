<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Get the list of quotas at a location.

.PARAMETER ResourceId
    The resource id.

.PARAMETER Name
    Name of the quota.

.PARAMETER Location
    The AzureStack location.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Quota.

#>
function Get-AzsSubscriptionsQuota
{
    [OutputType([Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Quota])]
    [CmdletBinding(DefaultParameterSetName='Quotas_List')]
    param(    
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_Quotas_Get')]
        [System.String]
        $ResourceId,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_Get')]
        [Alias('Quota')]
        [System.String]
        $Name,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_Get')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_List')]
        [System.String]
        $Location,
    
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_Quotas_Get')]
        [Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Quota]
        $InputObject
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

    $Quota = $Name

 
    if('InputObject_Quotas_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_Get' -eq $PsCmdlet.ParameterSetName) {
        $GetArmResourceIdParameterValue_params = @{
            IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Subscriptions.Admin/locations/{location}/quotas/{quota}'
        }

        if('ResourceId_Quotas_Get' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
        }
        else {
            $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
        }
        $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
        $location = $ArmResourceIdParameterValues['location']

        $quota = $ArmResourceIdParameterValues['quota']
    }


    if ('Quotas_List' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation ListWithHttpMessagesAsync on $SubscriptionsAdminClient.'
        $TaskResult = $SubscriptionsAdminClient.Quotas.ListWithHttpMessagesAsync($Location)
    } elseif ('Quotas_Get' -eq $PsCmdlet.ParameterSetName -or 'InputObject_Quotas_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_Get' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation GetWithHttpMessagesAsync on $SubscriptionsAdminClient.'
        $TaskResult = $SubscriptionsAdminClient.Quotas.GetWithHttpMessagesAsync($Location, $Quota)
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

