<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    List all quotas.

.PARAMETER ResourceId
    The resource id.

.PARAMETER Filter
    OData filter parameter.

.PARAMETER Name
    Name of the resource.

.PARAMETER Location
    Location of the resource.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Network.Admin.Models.Quota.

#>
function Get-AzsNetworkQuota
{
    [OutputType([Microsoft.AzureStack.Management.Network.Admin.Models.Quota])]
    [CmdletBinding(DefaultParameterSetName='Quotas_List')]
    param(    
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_Quotas_Get')]
        [System.String]
        $ResourceId,
    
        [Parameter(Mandatory = $false, ParameterSetName = 'Quotas_List')]
        [string]
        $Filter,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_Get')]
        [Alias('ResourceName')]
        [System.String]
        $Name,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_Get')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_List')]
        [System.String]
        $Location,
    
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_Quotas_Get')]
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

    

    $oDataQuery = ""
    if ($Filter) { $oDataQuery += "&`$Filter=$Filter" }
    $oDataQuery = $oDataQuery.Trim("&")
 
    $ResourceName = $Name

 
    if('InputObject_Quotas_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_Get' -eq $PsCmdlet.ParameterSetName) {
        $GetArmResourceIdParameterValue_params = @{
            IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Network.Admin/locations/{location}/quotas/{resourceName}'
        }

        if('ResourceId_Quotas_Get' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
        }
        else {
            $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
        }
        $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
        $location = $ArmResourceIdParameterValues['location']

        $resourceName = $ArmResourceIdParameterValues['resourceName']
    }


    if ('Quotas_List' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation ListWithHttpMessagesAsync on $NetworkAdminClient.'
        $TaskResult = $NetworkAdminClient.Quotas.ListWithHttpMessagesAsync($Location, $(if ($oDataQuery) { New-Object -TypeName "Microsoft.Rest.Azure.OData.ODataQuery``1[Microsoft.AzureStack.Management.Network.Admin.Models.Quota]" -ArgumentList $oDataQuery } else { $null }))
    } elseif ('Quotas_Get' -eq $PsCmdlet.ParameterSetName -or 'InputObject_Quotas_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_Get' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation GetWithHttpMessagesAsync on $NetworkAdminClient.'
        $TaskResult = $NetworkAdminClient.Quotas.GetWithHttpMessagesAsync($Location, $ResourceName)
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

