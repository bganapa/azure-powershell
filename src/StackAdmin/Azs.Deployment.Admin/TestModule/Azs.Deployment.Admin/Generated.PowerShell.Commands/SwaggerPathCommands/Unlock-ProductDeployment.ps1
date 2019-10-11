<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Unlocks the product subscription

.PARAMETER UnlockActionParameter
    Represents bootstrap action parameter

.PARAMETER ProductId
    The product identifier.

#>
function Unlock-ProductDeployment {
    [CmdletBinding(DefaultParameterSetName = 'ProductDeployment_Unlock')]
    param(    
        [Parameter(Mandatory = $true, ParameterSetName = 'ProductDeployment_Unlock')]
        [Microsoft.AzureStack.Management.Deployment.Admin.Models.UnlockActionParameters]
        $UnlockActionParameter,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'ProductDeployment_Unlock')]
        [System.String]
        $ProductId
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


        if ('ProductDeployment_Unlock' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation UnlockWithHttpMessagesAsync on $DeploymentAdminClient.'
            $TaskResult = $DeploymentAdminClient.ProductDeployment.UnlockWithHttpMessagesAsync($ProductId)
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

