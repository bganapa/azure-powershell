<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Create or update a quota.

.PARAMETER ResourceId
    The resource id.

.PARAMETER Quota
    New network quota to create.

.PARAMETER Name
    Name of the resource.

.PARAMETER Location
    Location of the resource.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Network.Admin.Models.Quota.

#>
function Set-AzsNetworkQuota
{
    [OutputType([Microsoft.AzureStack.Management.Network.Admin.Models.Quota])]
    [CmdletBinding(DefaultParameterSetName='Quotas_CreateOrUpdate')]
    param(    
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_Quotas_CreateOrUpdate')]
        [System.String]
        $ResourceId,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'ResourceId_Quotas_CreateOrUpdate')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_CreateOrUpdate')]
        [Parameter(Mandatory = $true, ParameterSetName = 'InputObject_Quotas_CreateOrUpdate')]
        [Microsoft.AzureStack.Management.Network.Admin.Models.Quota]
        $Quota,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_CreateOrUpdate')]
        [Alias('ResourceName')]
        [System.String]
        $Name,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_CreateOrUpdate')]
        [System.String]
        $Location,
    
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_Quotas_CreateOrUpdate')]
        [Microsoft.AzureStack.Management.Network.Admin.Models.Quota]
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
        FullClientTypeName = 'Microsoft.AzureStack.Management.Network.Admin.NetworkAdminClient'
    }

    $GlobalParameterHashtable = @{}
    $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable
     
    $GlobalParameterHashtable['SubscriptionId'] = $null
    if($PSBoundParameters.ContainsKey('SubscriptionId')) {
        $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
    }

    $NetworkAdminClient = New-ServiceClient @NewServiceClient_params

    $ResourceName = $Name

 
    if('InputObject_Quotas_CreateOrUpdate' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_CreateOrUpdate' -eq $PsCmdlet.ParameterSetName) {
        $GetArmResourceIdParameterValue_params = @{
            IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Network.Admin/locations/{location}/quotas/{resourceName}'
        }

        if('ResourceId_Quotas_CreateOrUpdate' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
        }
        else {
            $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
        }
        $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
        $location = $ArmResourceIdParameterValues['location']

        $resourceName = $ArmResourceIdParameterValues['resourceName']
    }


    if ('Quotas_CreateOrUpdate' -eq $PsCmdlet.ParameterSetName -or 'InputObject_Quotas_CreateOrUpdate' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_CreateOrUpdate' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation CreateOrUpdateWithHttpMessagesAsync on $NetworkAdminClient.'
        $TaskResult = $NetworkAdminClient.Quotas.CreateOrUpdateWithHttpMessagesAsync($Location, $ResourceName, $Quota)
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

