<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a quota by name.

.PARAMETER ResourceId
    The resource id.

.PARAMETER Name
    Name of the resource.

.PARAMETER Location
    Location of the resource.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Network.Admin.Models.Quota.

#>
function Remove-AzsNetworkQuota
{
    [CmdletBinding(DefaultParameterSetName='Quotas_Delete')]
    param(    
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_Quotas_Delete')]
        [System.String]
        $ResourceId,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_Delete')]
        [Alias('ResourceName')]
        [System.String]
        $Name,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'Quotas_Delete')]
        [System.String]
        $Location,
    
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_Quotas_Delete')]
        [Microsoft.AzureStack.Management.Network.Admin.Models.Quota]
        $InputObject,

        [Parameter(Mandatory = $false)]
        [switch]
        $AsJob
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

 
    if('InputObject_Quotas_Delete' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_Delete' -eq $PsCmdlet.ParameterSetName) {
        $GetArmResourceIdParameterValue_params = @{
            IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Network.Admin/locations/{location}/quotas/{resourceName}'
        }

        if('ResourceId_Quotas_Delete' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
        }
        else {
            $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
        }
        $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
        $location = $ArmResourceIdParameterValues['location']

        $resourceName = $ArmResourceIdParameterValues['resourceName']
    }


    if ('Quotas_Delete' -eq $PsCmdlet.ParameterSetName -or 'InputObject_Quotas_Delete' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_Quotas_Delete' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation DeleteWithHttpMessagesAsync on $NetworkAdminClient.'
        $TaskResult = $NetworkAdminClient.Quotas.DeleteWithHttpMessagesAsync($Location, $ResourceName)
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
    if($AsJob)
    {
        $ScriptBlockParameters = New-Object -TypeName 'System.Collections.Generic.Dictionary[string,object]'
        $ScriptBlockParameters['TaskResult'] = $TaskResult
        $ScriptBlockParameters['AsJob'] = $AsJob
        $ScriptBlockParameters['TaskHelperFilePath'] = $TaskHelperFilePath
        $PSCommonParameters.GetEnumerator() | ForEach-Object { $ScriptBlockParameters[$_.Name] = $_.Value }

        Start-PSSwaggerJobHelper -ScriptBlock $PSSwaggerJobScriptBlock `
                                     -CallerPSBoundParameters $ScriptBlockParameters `
                                     -CallerPSCmdlet $PSCmdlet `
                                     @PSCommonParameters
    }
    else
    {
        Invoke-Command -ScriptBlock $PSSwaggerJobScriptBlock `
                       -ArgumentList $TaskResult,$TaskHelperFilePath `
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

