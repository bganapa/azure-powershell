<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Deletes specified file container.

.DESCRIPTION
    Delete an existing file container.

.PARAMETER ResourceId
    The resource id.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Deployment.Admin.Models.FileContainer.

.PARAMETER Name
    The file container identifier.

#>
function Remove-FileContainer {
    [CmdletBinding(DefaultParameterSetName = 'FileContainers_Delete')]
    param(    
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_FileContainers_Delete')]
        [System.String]
        $ResourceId,
    
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_FileContainers_Delete')]
        [Microsoft.AzureStack.Management.Deployment.Admin.Models.FileContainer]
        $InputObject,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'FileContainers_Delete')]
        [Alias('FileContainerId')]
        [System.String]
        $Name
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
            FullClientTypeName = 'Microsoft.AzureStack.Management.Deployment.Admin.DeploymentAdminClient'
        }

        $GlobalParameterHashtable = @{ }
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable
     
        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $DeploymentAdminClient = New-ServiceClient @NewServiceClient_params

        $FileContainerId = $Name

 
        if ('InputObject_FileContainers_Delete' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_FileContainers_Delete' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Deployment.Admin/locations/global/fileContainers/{fileContainerId}'
            }

            if ('ResourceId_FileContainers_Delete' -eq $PsCmdlet.ParameterSetName) {
                $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
            }
            else {
                $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
            }
            $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
            $fileContainerId = $ArmResourceIdParameterValues['fileContainerId']
        }


        if ('FileContainers_Delete' -eq $PsCmdlet.ParameterSetName -or 'InputObject_FileContainers_Delete' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_FileContainers_Delete' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation DeleteWithHttpMessagesAsync on $DeploymentAdminClient.'
            $TaskResult = $DeploymentAdminClient.FileContainers.DeleteWithHttpMessagesAsync($FileContainerId)
        }
        else {
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

